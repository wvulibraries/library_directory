class SearchController < ApplicationController
  layout 'splash'
  def index
    clean_term = params[:query].gsub(%r{\{|\}|\[|\]|\\|\/|\^|\~|\:|\!|\"|\'}, '')
    @search_term = Sanitize.fragment clean_term
    @results = Elasticsearch::Model.search(
      search_query,
      [Employee, Building, Department]
    ).results
  end

  def search_query
    {
      "size": 1000,
      "query": {
        "function_score": {
          "query": {
            "bool": {
              "must": [multi_match],
              "must_not": [disabled_filter]
            }
          },
        "functions": priorities
        }
      }
    }
  end

  def multi_match
    {
      "multi_match": {
        "query": @search_term,
        "fields": %w[*_name name description job_title university_classification],
        "fuzziness": 'auto'
      }
    }
  end

  def disabled_filter
    {
      "term": { "status": "disabled" }
    }
  end

  def priorities
    [
      {
        "filter": {
          "term": { "status": 'enabled' }
        },
        "weight": 5000
      }
    ]
  end

end
