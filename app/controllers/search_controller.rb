class SearchController < ApplicationController

  def search_results
    query = params[:q]
    allRefs = GetCitations.all_citations
    @results = []
    allRefs.each do |ref|
      ref.attributes.except("id", "created_at", "updated_at").each do |name, value|
        if (value.to_s.downcase.include?(query.downcase))
          @results << ref
        end
      end
    end
    @results = @results.uniq
  end

end
