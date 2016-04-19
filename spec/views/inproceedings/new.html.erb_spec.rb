require 'rails_helper'

RSpec.describe "inproceedings/new", type: :view do
  before(:each) do
    assign(:inproceeding, Inproceeding.new(
      :reference => "MyString",
      :author => "MyString",
      :title => "MyString",
      :booktitle => "MyString",
      :editor => "MyString",
      :volume => 1,
      :number => 1,
      :series => "MyString",
      :pages => "MyString",
      :address => "MyString",
      :organization => "MyString",
      :publisher => "MyString",
      :year => 1,
      :month => 1,
      :note => "MyString"
    ))
  end

  it "renders new inproceeding form" do
    render

    assert_select "form[action=?][method=?]", inproceedings_path, "post" do

      assert_select "input#inproceeding_reference[name=?]", "inproceeding[reference]"

      assert_select "input#inproceeding_author[name=?]", "inproceeding[author]"

      assert_select "input#inproceeding_title[name=?]", "inproceeding[title]"

      assert_select "input#inproceeding_booktitle[name=?]", "inproceeding[booktitle]"

      assert_select "input#inproceeding_editor[name=?]", "inproceeding[editor]"

      assert_select "input#inproceeding_volume[name=?]", "inproceeding[volume]"

      assert_select "input#inproceeding_number[name=?]", "inproceeding[number]"

      assert_select "input#inproceeding_series[name=?]", "inproceeding[series]"

      assert_select "input#inproceeding_pages[name=?]", "inproceeding[pages]"

      assert_select "input#inproceeding_address[name=?]", "inproceeding[address]"

      assert_select "input#inproceeding_organization[name=?]", "inproceeding[organization]"

      assert_select "input#inproceeding_publisher[name=?]", "inproceeding[publisher]"

      assert_select "input#inproceeding_year[name=?]", "inproceeding[year]"

      assert_select "input#inproceeding_month[name=?]", "inproceeding[month]"

      assert_select "input#inproceeding_note[name=?]", "inproceeding[note]"
    end
  end
end
