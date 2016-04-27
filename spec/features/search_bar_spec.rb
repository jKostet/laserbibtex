require 'rails_helper'

describe "Search bar" do
  # split this to multiple methods
  it "searches from all the fields and all types of material" do
    article = Article.new(reference: "SEA00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    article = Article.new(reference: "SEA01", author: "Totoro", title: "Naapurini", journal: "Vuosikertomus metsästä", year: 1826, volume: 9)
    expect(article).to be_valid
    article.save

    book = Book.new(reference: "SEA02", author: "Artturi K. Kaarre", title: "Avaruusseikkailu 2000", publisher: "UFO-kirjat Oy", year: 1962)
    expect(book).to be_valid
    book.save

    visit articles_path

    fill_in('q', with: 'totoro')

    click_button "Search"

    expect(page).to have_content 'SEA01'
    expect(page).to have_content 'Totoro'
    expect(page).not_to have_content 'SEA00'

    visit home_path

    fill_in('q', with: 'SEA')

    click_button "Search"

    expect(page).to have_content 'SEA01'
    expect(page).to have_content 'SEA00'

    visit bibtex_path

    fill_in('q', with: '2000')

    click_button "Search"

    expect(page).to have_content 'SEA00'
    expect(page).to have_content 'asd'
    expect(page).to have_content 'SEA02'
    expect(page).to have_content 'Artturi'
    expect(page).not_to have_content 'Totoro'
  end
end