require 'rails_helper'

describe "Book page" do
  it "should not have anything before a book has been created" do
    visit books_path

    expect(page).to have_content 'Reference'
    expect(page).to have_content 'Author'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Publisher'
    expect(page).to have_content 'Volume'
    expect(page).to have_content 'Number'
    expect(page).to have_content 'Series'
    expect(page).to have_content 'Address'
    expect(page).to have_content 'Edition'
    expect(page).to have_content 'Year'
    expect(page).to have_content 'Month'
    expect(page).to have_content 'Note'

    expect(page).not_to have_content("ASD00")
  end

  it "shows added books" do
    book = Book.create(reference: "ASD00", author: "asd", title: "test", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    visit books_path

    expect(page).to have_content 'ASD00'
    expect(page).to have_content 'asd'
    expect(page).to have_content 'test'
    expect(page).to have_content 'asd publish'
  end

  it "allows user to navigate to the page of a book" do
    book = Book.create(reference: "ASD00", author: "asd", title: "test", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    visit books_path

    click_link "Show"

    expect(page).to have_content "Reference: ASD00"
  end

  it "allows user to edit the books" do
    book = Book.create(reference: "ASD00", author: "asd", title: "test", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    visit books_path

    click_link "Edit"

    fill_in('book_title', with: 'better title')

    click_button "Update Book"

    expect(page).to have_content "Book was successfully updated."
    expect(page).to have_content "Title: better title"
  end

  it "allows user to destroy books" do
    book = Book.create(reference: "ASD00", author: "asd", title: "test", publisher: "asd publish", year: 2000)
    expect(book).to be_valid

    visit books_path

    click_link "Destroy"

    expect(page).to have_content("Book was successfully destroyed.")
    expect(page).not_to have_content("ASD00")
  end
end