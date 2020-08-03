# Search Controller
class SearchController < ApplicationController
  layout 'splash'
  def index
    clean_term = params[:query].gsub(%r{\{|\}|\[|\]|\\|\/|\^|\~|\:|\!|\"|\'}, '')
    @search_term = Sanitize.fragment clean_term
    @results = Elasticsearch::Model.search(
      search_query,
      [Employee, Building, Department]
    ).results

    # @results = Employee.search(search_query).results
  end

  # Search Query is used to create a better score for searches across multiple models. For use in this controller only.
  # @author David J. Davis
  # @since 0.0.1
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

  # Abstracting the multi-match search query out from the other function for maintability, this belongs with search query and for use in this controller only. Is dependent of the @search_term being present.
  # @author David J. Davis
  # @since 0.0.1
  def multi_match
    {
      "multi_match": {
        "query": @search_term,
        "type": 'cross_fields',
        "fields": %w[*_name^10 subjects.name^5 type job_title university_classification phones.number],
        "operator": 'and'
        # "fuzziness": 'auto'
      }
    }
  end

  # Abstracting the disabled filter.  This basically says if the status is disabled, then it is not allowed to be returned in the search results.
  # @author David J. Davis
  # @since 0.0.1
  def disabled_filter
    {
      "term": { "status": 'disabled' }
    }
  end

  # Furthering that we are boosting things with a status of enabled, that way if a null item is in the mix it is not ignored, but is sent to the back of the results.
  # @author David J. Davis
  # @since 0.0.1
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
