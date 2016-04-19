require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Series/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Edition/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Note/)
  end
end
