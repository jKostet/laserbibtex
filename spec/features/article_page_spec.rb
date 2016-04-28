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

    expect(page).not_to have_content("asd")
  end

  it "shows added articles" do
    article = Article.new(reference: "ART00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    visit articles_path

    expect(page).to have_content 'ART00'
    expect(page).to have_content 'asd'
    expect(page).to have_content 'test'
    expect(page).to have_content 'asd journal'
  end

  it "allows user to navigate to the page of an article" do
    article = Article.new(reference: "ART01", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    visit articles_path

    click_link "Show"

    expect(page).to have_content "Reference: ART01"
  end

  it "allows user to edit the articles" do
    article = Article.new(reference: "ART02", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    visit articles_path

    click_link "Edit"

    fill_in('article_title', with: 'better title')

    click_button "Update Article"

    expect(page).to have_content "Article was successfully updated."
    expect(page).to have_content "Title: better title"
  end

  it "allows user to destroy articles" do
    article = Article.new(reference: "ART03", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    visit articles_path

    click_link "Destroy"

    expect(page).to have_content("Article was successfully destroyed.")
    expect(page).not_to have_content("ART03")
  end

  it "generates reference automatically if field is left empty" do
    visit articles_path

    click_link "New Article"

    fill_in('article_author', with: 'Sotilas Tähtien, LMAO AYYY')
    fill_in('article_title', with: 'Kurpitsakirjat')
    fill_in('article_journal', with: 'Eeppisiä tarinoita avaruudesta ja puutarhasta')
    fill_in('article_year', with: '2080')
    fill_in('article_volume', with: '3')

    click_button "Create Article"

    expect(page).to have_content("Article was successfully created.")

    click_link "Back"

    click_link "New Article"

    fill_in('article_author', with: 'Sotilas Tähtien, LMAO AYYY')
    fill_in('article_title', with: 'Kurpitsakirjat')
    fill_in('article_journal', with: 'Eeppisiä tarinoita avaruudesta ja puutarhasta')
    fill_in('article_year', with: '2080')
    fill_in('article_volume', with: '1')

    click_button "Create Article"

    expect(page).to have_content("Article was successfully created.")

    click_link "Back"

    click_link "New Article"

    fill_in('article_author', with: 'Sotilas Tähtien, LMAO AYYY')
    fill_in('article_title', with: 'Kurpitsakirjat')
    fill_in('article_journal', with: 'Eeppisiä tarinoita avaruudesta ja puutarhasta')
    fill_in('article_year', with: '2080')
    fill_in('article_volume', with: '4')

    click_button "Create Article"

    expect(page).to have_content("Article was successfully created.")

    click_link "Back"

    expect(page).to have_content("SL2080")
    expect(page).to have_content("SL2080a")
    expect(page).to have_content("SL2080b")
  end
end
