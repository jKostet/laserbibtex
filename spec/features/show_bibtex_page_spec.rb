require 'rails_helper'

describe "Show BibTeX page" do
  it "should not have anything before something has been created" do
    visit bibtex_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'Articles'
    expect(page).to have_content 'Books'

    expect(page).not_to have_content("asd")
  end

  it "lists added objects correctly" do
    article = Article.new(reference: "ARTBIB", author: "asd", title: "test", journal: "asd journal", year: 2000, volume: 1)
    expect(article).to be_valid
    article.save

    book = Book.new(reference: "BOOBIB", author: "asdasd", title: "testtest", publisher: "asd publish", year: 2000)
    expect(book).to be_valid
    book.save

    inproceeding = Inproceeding.new(reference: "INPBIB", author: "asdasdasd", title: "testtesttest", booktitle: "asd booktitle", year: 3000)
    expect(inproceeding).to be_valid
    inproceeding.save

    visit bibtex_path

    expect(page).to have_content '@article{ARTBIB,'
    expect(page).to have_content '@book{BOOBIB,'
    expect(page).to have_content '@inproceedings{INPBIB,'
    expect(page).to have_content 'author = {asd},'
    expect(page).to have_content 'title = {testtest},'
    expect(page).to have_content 'year = {3000},'
    expect(page).to have_content 'publisher = {asd publish},'
  end
end
