require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {Book.create(reference:"asdasd", author:"vilma vallaton", title:"laalalaa", publisher:"aaab", year:2010)}

  it "sets the reference correctly" do
      expect(book.reference).to eq("asdasd")
  end

  it "sets the author correctly" do
    expect(book.author).to eq("vilma vallaton")
  end

  it "sets the title correctly" do
    expect(book.title).to eq("laalalaa")
  end

  it "sets the publisher correctly" do
    expect(book.publisher).to eq("aaab")
  end

  it "sets the year correctly" do
    expect(book.year).to be(2010)
  end

  it "generates bibtex for book type citation" do
    s = book.toBibTex
    bib = "@article{#{book.reference},\n" +
        "\tauthor = {#{book.author}},\n" +
        "\ttitle = {#{book.title}},\n" +
        "\tpublisher = {#{book.publisher}},\n" +
        "\tyear = {#{book.year}},\n}\n\n"
  end

end
