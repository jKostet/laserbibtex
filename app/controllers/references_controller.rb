class ReferencesController < ApplicationController
  def references
    @inproceedings = Inproceeding.all
    @articles = Article.all
    @books = Book.all

  end
end
