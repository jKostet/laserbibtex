require 'rails_helper'

RSpec.describe Book, type: :model do

  it "generates bibtex for book type citation" do
    book = Book.create(reference:"asdasd", author:"vilma vallaton", title:"laalalaa", publisher:"aaab", year:2010)
    s = book.toBibTex
    bib = "@article{#{book.reference},\n" +
        "\tauthor = {#{book.author}},\n" +
        "\ttitle = {#{book.title}},\n" +
        "\tpublisher = {#{book.publisher}},\n" +
        "\tyear = {#{book.year}},\n}\n\n"
  end

end
