require 'rails_helper'

describe "All references page" do
  it "should not have anything before something has been created" do
    visit references_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'reference'
    expect(page).to have_content 'author'
    expect(page).to have_content 'title'

    expect(page).not_to have_content("ASD00")
  end

  it "lists added objects correctly" do
    article = Article.create(reference: "ASD00", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid

    book = Book.create(reference: "ASD01", author: "asdasd", title: "testtest", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    inproceeding = Inproceeding.create(reference: "ASD02", author: "asdasdasd", title: "testtesttest", booktitle: "asd booktitle", year: 3000)
    expect(inproceeding).to be_valid

    visit references_path

    expect(page).to have_content 'ASD00'
    expect(page).to have_content 'ASD01'
    expect(page).to have_content 'asdasd'
    expect(page).to have_content 'asdasdasd'
    expect(page).to have_content 'testtesttest'
  end
end