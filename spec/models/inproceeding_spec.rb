require 'rails_helper'

RSpec.describe Inproceeding, type: :model do
  let(:i) {Inproceeding.create(reference:"IN10", author:"vilma vallaton", title:"laalalaa", booktitle:"aaab", year:2010)}

  it "sets the reference correctly" do
    expect(i.reference).to eq("IN10")
  end

  it "sets the author correctly" do
    expect(i.author).to eq("vilma vallaton")
  end

  it "sets the title correctly" do
    expect(i.title).to eq("laalalaa")
  end

  it "sets the booktitle correctly" do
    expect(i.booktitle).to eq("aaab")
  end

  it "sets the year correctly" do
    expect(i.year).to be(2010)
  end


  it "generates bibtex for inproceedings type citation" do
    s = i.toBibTex
    bib = "@article{#{i.reference},\n" +
        "\tauthor = {#{i.author}},\n" +
        "\ttitle = {#{i.title}},\n" +
        "\tbooktitle = {#{i.booktitle}},\n" +
        "\tyear = {#{i.year}},\n}\n\n"
  end

end
