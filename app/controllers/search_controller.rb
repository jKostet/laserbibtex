class SearchController < ApplicationController

  def search_results
    query = params[:q]
    @results = []
    out << Article.advanced_search(query)
    out << Book.advanced_search(query)
    out << Inproceeding.advanced_search(query)
    @results = @results.uniq
  end

end
