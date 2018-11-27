class SearchController < ApplicationController
  layout 'splash'
  def index
    clean_term = params[:query].gsub(%r{\{|\}|\[|\]|\\|\/|\^|\~|\:|\!|\"|\'}, '')
    @search_term = Sanitize.fragment clean_term
    @results = Elasticsearch::Model.search(
      @search_term,
      [Employee, Building, Department],
      size: 1000
    ).results
  end
end
