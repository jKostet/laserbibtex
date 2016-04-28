require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) {FactoryGirl.build(:article)}

  it "is not saved without reference" do
    article.reference = nil
    expect(article).not_to be_valid
    expect(Article.count).to eq(0)
  end

  it "is saved if non-required fields are missing" do
    expect(article).to be_valid
    article.save
    expect(Article.count).to be(1)
  end

  it "has reference set correctly" do
    expect(article.reference).to eq("A2016")
  end

  it "has author set correctly" do
    expect(article.author).to eq("pirjospiruliina")
  end

  it "has title set correctly" do
    expect(article.title).to eq("purjojen sielunelämä")
  end

  it "has journal set correctly" do
    expect(article.journal).to eq("asd journal")
  end

  it "has year set correctly" do
    expect(article.year).to be(2016)
  end

  it "has volume set correctly" do
    expect(article.volume).to be(2)
  end

end
