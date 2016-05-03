require 'rails_helper'

describe "Search bar" do
  let(:article) { FactoryGirl.build(:article) }
  let(:article_multiple) { FactoryGirl.build(:article_multiple) }
  let(:book) { FactoryGirl.build(:book) }
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

  it "matches fields with AND" do
    expect(article).to be_valid
    article.save

    expect(article_multiple).to be_valid
    article_multiple.save

    expect(book).to be_valid
    book.save

    visit home_path

    fill_in('q', with: 'pirjo AND spurdo')

    click_button "Search"

    expect(page).to have_content 'A2080'
    expect(page).not_to have_content 'A2016'
    expect(page).not_to have_content 'B2016'
  end

  it "matches fields with multiple AND" do
    expect(article).to be_valid
    article.save

    expect(article_multiple).to be_valid
    article_multiple.save

    expect(book).to be_valid
    book.save

    visit home_path

    fill_in('q', with: 'pirjo AND purjo AND spurdo')

    click_button "Search"

    expect(page).to have_content 'A2080'
    expect(page).not_to have_content 'A2016'
    expect(page).not_to have_content 'B2016'
  end

  it "does not match lowercase and" do
    expect(article_multiple).to be_valid
    article_multiple.save

    visit home_path

    fill_in('q', with: 'pirjo and purjo')

    click_button "Search"

    expect(page).not_to have_content 'A2080'
  end
end