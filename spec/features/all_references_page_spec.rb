require 'rails_helper'

describe "All references page" do
  let(:article) { FactoryGirl.build(:article) }
  let(:book) { FactoryGirl.create(:book) }
  let(:inproceeding) { FactoryGirl.build(:inproceeding) }

  it "should not have anything before something has been created" do
    visit references_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'reference'
    expect(page).to have_content 'author'
    expect(page).to have_content 'title'

    expect(page).not_to have_content("2016")
  end

  it "lists added objects correctly" do
    expect(article).to be_valid
    article.save

    expect(book).to be_valid
    book.save

    expect(inproceeding).to be_valid
    inproceeding.save

    visit references_path

    expect(page).to have_content 'A2016'
    expect(page).to have_content 'B2016'
    expect(page).to have_content 'ville vallaton'
    expect(page).to have_content 'puffet on hyvää'
    expect(page).to have_content 'purjojen sielunelämä'
  end
end