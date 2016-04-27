require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryGirl.create(:book) }

  it "sets the reference correctly" do
      expect(book.reference).to eq("B2016")
  end

  it "sets the author correctly" do
    expect(book.author).to eq("jarikorianteri")
  end

  it "sets the title correctly" do
    expect(book.title).to eq("puffet on hyvää")
  end

  it "sets the publisher correctly" do
    expect(book.publisher).to eq("asd publishing")
  end

  it "sets the year correctly" do
    expect(book.year).to be(2016)
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
