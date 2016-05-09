require 'rails_helper'

describe "Book page" do
  let(:book) { FactoryGirl.build(:book) }
  let(:book_multiple) { FactoryGirl.build(:book_multiple) }

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

    expect(page).not_to have_content("B2016")
  end

  it "shows added books" do
    expect(book).to be_valid
    book.save

    visit books_path

    expect(page).to have_content 'B2016'
    expect(page).to have_content 'jarikorianteri'
    expect(page).to have_content 'puffet on hyvää'
    expect(page).to have_content 'asd publishing'
  end

  it "allows user to navigate to the page of a book" do
    expect(book).to be_valid
    book.save

    visit books_path

    click_link "Show"

    expect(page).to have_content "Reference: B2016"
  end

  it "allows user to edit the books" do
    expect(book).to be_valid
    book.save

    visit books_path

    click_link "Edit"

    fill_in('book_title', with: 'better title')

    click_button "Update Book"

    expect(page).to have_content "Book was successfully updated."
    expect(page).to have_content "Title: better title"
  end

  it "allows user to destroy books" do
    expect(book).to be_valid
    book.save

    visit books_path

    click_link "Destroy"

    expect(page).to have_content("Book was successfully destroyed.")
    expect(page).not_to have_content("B2016")
  end

  it "generates reference automatically if field is left empty" do
    visit books_path

    create_identical_books
    create_identical_books
    create_identical_books

    expect(page).to have_content("SL2080")
    expect(page).to have_content("SL2080a")
    expect(page).to have_content("SL2080b")
  end

  it "allows multiple authors" do
    expect(book_multiple).to be_valid
    book_multiple.save

    visit books_path

    expect(page).to have_content("B2080")
  end

  def create_identical_books
    click_link "New Book"

    fill_in('book_author', with: 'Sotilas Tähtien and LMAO AYYY')
    fill_in('book_title', with: 'Kurpitsakirjallisuus')
    fill_in('book_publisher', with: 'Avaruus ja puutarha')
    fill_in('book_year', with: '2080')

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")

  end
end