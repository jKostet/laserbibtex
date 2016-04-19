require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :reference => "Reference",
        :author => "Author",
        :title => "Title",
        :publisher => "Publisher",
        :volume => 1,
        :number => 2,
        :series => "Series",
        :address => "Address",
        :edition => "Edition",
        :year => 3,
        :month => 4,
        :note => "Note"
      ),
      Book.create!(
        :reference => "Reference",
        :author => "Author",
        :title => "Title",
        :publisher => "Publisher",
        :volume => 1,
        :number => 2,
        :series => "Series",
        :address => "Address",
        :edition => "Edition",
        :year => 3,
        :month => 4,
        :note => "Note"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Series".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Edition".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
