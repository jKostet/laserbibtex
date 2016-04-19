require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Series/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Edition/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Note/)
  end
end
