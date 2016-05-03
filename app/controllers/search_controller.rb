class SearchController < ApplicationController

  def search_results
    query = params[:q]
    @queries = query.split(" AND ")
    @results = []

    all_citations = GetCitations.all_citations

    all_citations.each do |citation|
      if check_queries(citation)
        @results << citation
      end
    end

    @results = @results.uniq
  end

  # Checks if given citation includes all the given queries
  def check_queries(citation)
    found = false
    @queries.each do |q|
      found = check_citation(citation,q)
      # if the citation doesn't include a query, no need to check the others
      if !found
        break
      end
    end
    found
  end

  # Checks if given citation includes a single query
  def check_citation(citation, query)
    citation.attributes.except("id", "created_at", "updated_at").each do |name, value|
      if (value.to_s.downcase.include?(query.downcase))
        return true
      end
    end
    false
  end

end
