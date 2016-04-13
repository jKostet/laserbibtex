require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is not saved without reference" do
    article = Article.create(author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).not_to be_valid
    expect(Article.count).to eq(0)
  end

  describe "with all required fields" do
    let(:article) {Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)}

    it "is saved if non-required fields are missing" do
      expect(article).to be_valid
      expect(Article.count).to be(1)
    end

    it "has reference set correctly" do
      expect(article.reference).to eq("ASD00")
    end

    it "has author set correctly" do
      expect(article.author).to eq("asd")
    end

    it "has title set correctly" do
      expect(article.title).to eq("test")
    end

    it "has journal set correctly" do
      expect(article.journal).to eq("asd journal")
    end

    it "has year set correctly" do
      expect(article.year).to be(2000)
    end

    it "has volume set correctly" do
      expect(article.volume).to be(1)
    end
  end

  describe "with special characters" do
    let(:article) {Article.create(reference: "ÄÄK16", author: "Ääkkönen, Yrjö", title: "AAA CS", journal: "Öökköslehti", year: 2016, volume: 3)}

    it "should replace special characters" do
      s = article.encode_special_chars(article.author)
      expect(s).to eq("\\\"{A}\"\\\"{a}\"kk\\\"{o}\"nen, Yrj\\\"{o}\"")
    end

    it "should replace special substrings" do
      s = article.encode_special_chars(article.title)
      expect(s).to eq("{A}{A}{A} {C}{S}")
    end
  end

  describe "generating bibtex" do
    let(:article) {Article.create(reference: "VAL02", author: "Vallaton, Ville", title: "Test", journal: "ASD Journal of ASD", year: 2002, volume: 2)}

    it "should generate proper form for bibtex" do
      s = article.toBibTex
      bib = "@article{#{article.reference},\n"
          + "\tauthor = {#{article.author}},\n"
          + "\ttitle = {#{article.title}},\n"
          + "\tjournal = {#{article.journal}},\n"
          + "\tyear = {#{article.year}},\n"
          + "\tvolume = {#{article.volume}}\n}"

      expect(s).to eq(bib)
    end

  end

end