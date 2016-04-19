require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :id => 1,
        :author => "Author",
        :title => "Title",
        :publisher => "Publisher",
        :volume => 2,
        :number => 3,
        :series => "Series",
        :address => "Address",
        :edition => "Edition",
        :year => 4,
        :month => 5,
        :note => "Note"
      ),
      Book.create!(
        :id => 1,
        :author => "Author",
        :title => "Title",
        :publisher => "Publisher",
        :volume => 2,
        :number => 3,
        :series => "Series",
        :address => "Address",
        :edition => "Edition",
        :year => 4,
        :month => 5,
        :note => "Note"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Series".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Edition".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
