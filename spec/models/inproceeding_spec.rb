require 'rails_helper'

RSpec.describe Inproceeding, type: :model do
  let(:i) { FactoryGirl.build(:inproceeding) }

  it "sets the reference correctly" do
    expect(i.reference).to eq("I2015")
  end

  it "sets the author correctly" do
    expect(i.author).to eq("ville vallaton")
  end

  it "sets the title correctly" do
    expect(i.title).to eq("otsikko")
  end

  it "sets the booktitle correctly" do
    expect(i.booktitle).to eq("jätskit kautta aikojen")
  end

  it "sets the year correctly" do
    expect(i.year).to be(2015)
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
