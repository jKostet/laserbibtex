require 'rails_helper'

describe "Show BibTeX page" do
  let(:article) { FactoryGirl.build(:article) }
  let(:book) { FactoryGirl.create(:book) }
  let(:inproceeding) { FactoryGirl.build(:inproceeding) }

  it "should not have anything before something has been created" do
    visit bibtex_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'Articles'
    expect(page).to have_content 'Books'

    expect(page).not_to have_content("2016")
  end

  it "lists added objects correctly" do
    expect(article).to be_valid
    article.save

    expect(book).to be_valid
    book.save

    expect(inproceeding).to be_valid
    inproceeding.save

    visit bibtex_path

    expect(page).to have_content '@article{A2016,'
    expect(page).to have_content '@book{B2016,'
    expect(page).to have_content '@inproceedings{I2015,'
    expect(page).to have_content 'author = {pirjospiruliina},'
    expect(page).to have_content 'year = {2015},'
    expect(page).to have_content 'publisher = {asd publishing},'
  end
end
