class ReferencesController < ApplicationController

  def references
    @allRefs = GetCitations.all_citations
  end

  def show_bibtex
    @bibtex = CreateBibtex.createBibString
  end

end
