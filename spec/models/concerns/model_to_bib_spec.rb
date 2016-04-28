require 'rails_helper'

RSpec.describe ModelToBib do
  describe "with special characters" do
    let(:article) {FactoryGirl.create(:article_specials)}

    it "should replace special characters" do
      s = article.encode_special_chars(article.author)
      expect(s).to eq("\\\"{A}\"\\\"{a}\"kk\\\"{o}\"nen Yrj\\\"{o}\"")
    end

    it "should replace special substrings" do
      s = article.encode_special_chars(article.title)
      expect(s).to eq("{A}{A}{A} {C}{S}")
    end
  end

  describe "generating bibtex" do
    it "should generate proper form article for bibtex" do
      citation = FactoryGirl.create(:article)
      s = citation.toBibTex
      bib = "@article{#{citation.encode_special_chars(citation.reference)},\n" +
          "\tauthor = {#{citation.encode_special_chars(citation.author)}},\n" +
          "\ttitle = {#{citation.encode_special_chars(citation.title)}},\n" +
          "\tjournal = {#{citation.encode_special_chars(citation.journal)}},\n" +
          "\tyear = {#{citation.year}},\n" +
          "\tvolume = {#{citation.volume}},\n}\n\n"

      expect(s).to eq(bib)
    end

    it "should generate proper form book for bibtex" do
      citation = FactoryGirl.create(:book)
      s = citation.toBibTex
      bib = "@book{#{citation.encode_special_chars(citation.reference)},\n" +
          "\tauthor = {#{citation.encode_special_chars(citation.author)}},\n" +
          "\ttitle = {#{citation.encode_special_chars(citation.title)}},\n" +
          "\tpublisher = {#{citation.encode_special_chars(citation.publisher)}},\n" +
          "\tyear = {#{citation.year}},\n}\n\n"

      expect(s).to eq(bib)
    end

    it "should generate proper form inproceedings for bibtex" do
      citation = FactoryGirl.create(:inproceeding)
      s = citation.toBibTex
      bib = "@inproceedings{#{citation.encode_special_chars(citation.reference)},\n" +
          "\tauthor = {#{citation.encode_special_chars(citation.author)}},\n" +
          "\ttitle = {#{citation.encode_special_chars(citation.title)}},\n" +
          "\tbooktitle = {#{citation.encode_special_chars(citation.booktitle)}},\n" +
          "\tyear = {#{citation.year}},\n}\n\n"

      expect(s).to eq(bib)
    end

  end

end
