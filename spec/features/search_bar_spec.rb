require 'rails_helper'

describe "Search bar" do
  let(:article) { FactoryGirl.build(:article) }
  let(:book) { FactoryGirl.create(:book) }
  let(:inproceeding) { FactoryGirl.build(:inproceeding) }

  it "matches one hit from any field" do
    expect(article).to be_valid
    article.save

    expect(book).to be_valid
    book.save

    visit articles_path

    fill_in('q', with: 'pirjo')

    click_button "Search"

    expect(page).to have_content 'A2016'
    expect(page).to have_content 'pirjo'
    expect(page).not_to have_content 'B2016'
  end

  it "matches hits from multiple types of references" do
    expect(article).to be_valid
    article.save

    expect(book).to be_valid
    book.save

    visit home_path

    fill_in('q', with: '2016')

    click_button "Search"

    expect(page).to have_content 'A2016'
    expect(page).to have_content 'B2016'
  end

  it "searches case insensitively" do
    expect(article).to be_valid
    article.save

    visit bibtex_path

    fill_in('q', with: 'PIRJOSPIRULIINA')

    click_button "Search"

    expect(page).to have_content 'A2016'
    expect(page).to have_content 'pirjospiruliina'
  end

  it "matches to field that are not shown" do
    expect(inproceeding).to be_valid
    inproceeding.save

    visit inproceedings_path

    fill_in('q', with: 'aikojen')

    click_button "Search"

    expect(page).to have_content 'I2015'
    expect(page).not_to have_content('jätskit kautta aikojen')
  end
end