require 'rails_helper'

RSpec.describe Inproceeding, type: :model do

  it "generates bibtex for inproceedings type citation" do
    i = Inproceeding.create(reference:"IN10", author:"vilma vallaton", title:"laalalaa", booktitle:"aaab", year:2010)
    s = i.toBibTex
    bib = "@article{#{i.reference},\n" +
        "\tauthor = {#{i.author}},\n" +
        "\ttitle = {#{i.title}},\n" +
        "\tbooktitle = {#{i.booktitle}},\n" +
        "\tyear = {#{i.year}},\n}\n\n"
  end

end
