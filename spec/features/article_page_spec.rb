require 'rails_helper'

describe "Article page" do
  it "should not have anything before an article has been created" do
    visit articles_path

    expect(page).to have_content 'Reference'
    expect(page).to have_content 'Author'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Journal'
    expect(page).to have_content 'Year'
    expect(page).to have_content 'Volume'
    expect(page).to have_content 'Number'
    expect(page).to have_content 'Pages'
    expect(page).to have_content 'Month'
    expect(page).to have_content 'Note'
    expect(page).to have_content 'Key'

    expect(page).not_to have_content("ASD00")
  end

  it "shows added articles" do
    article = Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    visit articles_path

    expect(page).to have_content 'ASD00'
    expect(page).to have_content 'asd'
    expect(page).to have_content 'test'
    expect(page).to have_content 'asd journal'
  end

  it "allows user to navigate to the page of an article" do
    article = Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    visit articles_path

    click_link "Show"

    expect(page).to have_content "Reference: ASD00"
  end

  it "allows user to edit the articles" do
    article = Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    visit articles_path

    click_link "Edit"

    fill_in('article_title', with: 'better title')

    click_button "Update Article"

    expect(page).to have_content "Article was successfully updated."
    expect(page).to have_content "Title: better title"
  end

  it "allows user to destroy articles" do
    article = Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    visit articles_path

    click_link "Destroy"

    expect(page).to have_content("Article was successfully destroyed.")
    expect(page).not_to have_content("ASD00")
  end
end
