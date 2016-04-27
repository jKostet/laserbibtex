require 'rails_helper'

describe "All references page" do
  it "should not have anything before something has been created" do
    visit references_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'reference'
    expect(page).to have_content 'author'
    expect(page).to have_content 'title'

    expect(page).not_to have_content("asd")
  end

  it "lists added objects correctly" do
    article = Article.new(reference: "ALL00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    book = Book.new(reference: "ALL01", author: "asdasd", title: "testtest", publisher: "asd publish", year: 2000)
    expect(book).to be_valid
    book.save

    inproceeding = Inproceeding.new(reference: "ALL02", author: "asdasdasd", title: "testtesttest", booktitle: "asd booktitle", year: 3000)
    expect(inproceeding).to be_valid
    inproceeding.save

    visit references_path

    expect(page).to have_content 'ALL00'
    expect(page).to have_content 'ALL01'
    expect(page).to have_content 'asdasd'
    expect(page).to have_content 'asdasdasd'
    expect(page).to have_content 'testtesttest'
  end

=begin
  it "matches search with all fields" do
    article = Article.create(reference: "ALL03", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    book = Book.create(reference: "ALL04", author: "asdasd", title: "testtest", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    inproceeding = Inproceeding.create(reference: "ALL05", author: "no", title: "nono", booktitle: "nonono booktitle", year: 3000)
    expect(inproceeding).to be_valid

    visit references_path

    fill_in('q', with: 'asd')

    click_button "Search"

    expect(page).to have_content 'ALL03'
    expect(page).to have_content 'ALL04'
    expect(page).not_to have_content 'ALL05'

    fill_in('q', with: 'no')

    click_button "Search"

    expect(page).to have_content 'ALL05'
    expect(page).not_to have_content 'ALL04'

    fill_in('q', with: 'publish')

    click_button "Search"

    expect(page).to have_content 'ALL04'
    expect(page).not_to have_content 'ALL03'
  end
=end
end