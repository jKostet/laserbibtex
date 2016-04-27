require 'rails_helper'

describe "Show BibTeX page" do
  it "should not have anything before something has been created" do
    visit bibtex_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'Articles'
    expect(page).to have_content 'Books'

    expect(page).not_to have_content("ASD00")
  end

  it "lists added objects correctly" do
    article = Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    book = Book.create(reference: "ASD01", author: "asdasd", title: "testtest", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    inproceeding = Inproceeding.create(reference: "ASD02", author: "asdasdasd", title: "testtesttest", booktitle: "asd booktitle", year: 3000)
    expect(inproceeding).to be_valid

    visit bibtex_path

    expect(page).to have_content '@article{ASD00,'
    expect(page).to have_content '@book{ASD01,'
    expect(page).to have_content '@inproceeding{ASD02,'
    expect(page).to have_content 'author = {asd},'
    expect(page).to have_content 'title = {testtest},'
    expect(page).to have_content 'year = {3000},'
    expect(page).to have_content 'publisher = {asd publish},'
  end
end