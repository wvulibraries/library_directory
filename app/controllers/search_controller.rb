class SearchController < ApplicationController
  layout 'splash'
  def index
    @search_term = Sanitize.fragment params[:query]
    @results = Elasticsearch::Model.search(
      @search_term,
      [Employee, Building, Department],
      size: 1000
    ).results

    # @results = Employee.search(params[:query])
  end
end
