require 'rails_helper'

RSpec.describe "inproceedings/index", type: :view do
  before(:each) do
    assign(:inproceedings, [
      Inproceeding.create!(
        :reference => "Reference",
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
      ),
      Inproceeding.create!(
        :reference => "Reference",
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
      )
    ])
  end

  it "renders a list of inproceedings" do
    render
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Booktitle".to_s, :count => 2
    assert_select "tr>td", :text => "Editor".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Series".to_s, :count => 2
    assert_select "tr>td", :text => "Pages".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
