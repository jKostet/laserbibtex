class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def help
  end

  def download_bibtex
    send_data(CreateBibtex.createBibString, filename:"references.bib")
  end
end
