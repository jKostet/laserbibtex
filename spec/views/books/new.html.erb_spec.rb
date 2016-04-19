require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :reference => "MyString",
      :author => "MyString",
      :title => "MyString",
      :publisher => "MyString",
      :volume => 1,
      :number => 1,
      :series => "MyString",
      :address => "MyString",
      :edition => "MyString",
      :year => 1,
      :month => 1,
      :note => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_reference[name=?]", "book[reference]"

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_publisher[name=?]", "book[publisher]"

      assert_select "input#book_volume[name=?]", "book[volume]"

      assert_select "input#book_number[name=?]", "book[number]"

      assert_select "input#book_series[name=?]", "book[series]"

      assert_select "input#book_address[name=?]", "book[address]"

      assert_select "input#book_edition[name=?]", "book[edition]"

      assert_select "input#book_year[name=?]", "book[year]"

      assert_select "input#book_month[name=?]", "book[month]"

      assert_select "input#book_note[name=?]", "book[note]"
    end
  end
end
