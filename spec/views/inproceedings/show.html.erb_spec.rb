require 'rails_helper'

RSpec.describe "inproceedings/show", type: :view do
  before(:each) do
    @inproceeding = assign(:inproceeding, Inproceeding.create!(
      :author => "Author",
      :title => "Title",
      :booktitle => "Booktitle",
      :editor => "Editor",
      :volume => 1,
      :number => 2,
      :series => "Series",
      :pages => "Pages",
      :address => "Address",
      :organization => "Organization",
      :publisher => "Publisher",
      :year => 3,
      :month => 4,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Booktitle/)
    expect(rendered).to match(/Editor/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Series/)
    expect(rendered).to match(/Pages/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Note/)
  end
end
