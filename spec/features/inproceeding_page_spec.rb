require 'rails_helper'

describe "Inproceeding page" do
  it "should not have anything before an inproceeding has been created" do
    visit inproceedings_path

    expect(page).to have_content 'Reference'
    expect(page).to have_content 'Author'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Booktitle'
    expect(page).to have_content 'Editor'
    expect(page).to have_content 'Volume'
    expect(page).to have_content 'Number'
    expect(page).to have_content 'Series'
    expect(page).to have_content 'Number'
    expect(page).to have_content 'Pages'
    expect(page).to have_content 'Address'
    expect(page).to have_content 'Organization'
    expect(page).to have_content 'Publisher'
    expect(page).to have_content 'Year'
    expect(page).to have_content 'Month'
    expect(page).to have_content 'Note'

    expect(page).not_to have_content("asd")
  end

  it "shows added inproceeding" do
    inproceeding = Inproceeding.new(reference: "INP00", author: "asd", title: "test", booktitle: "asd booktitle", year: 2000)
    expect(inproceeding).to be_valid
    inproceeding.save

    visit inproceedings_path

    expect(page).to have_content 'INP00'
    expect(page).to have_content 'asd'
    expect(page).to have_content 'test'
    expect(page).to have_content 'asd booktitle'
  end

  it "allows user to navigate to the page of an inproceeding" do
    inproceeding = Inproceeding.new(reference: "INP01", author: "asd", title: "test", booktitle: "asd booktitle", year: 2000)
    expect(inproceeding).to be_valid
    inproceeding.save

    visit inproceedings_path

    click_link "Show"

    expect(page).to have_content "Reference: INP01"
  end

  it "allows user to edit the inproceedings" do
    inproceeding = Inproceeding.new(reference: "INP02", author: "asd", title: "test", booktitle: "asd booktitle", year: 2000)
    expect(inproceeding).to be_valid
    inproceeding.save

    visit inproceedings_path

    click_link "Edit"

    fill_in('inproceeding_title', with: 'better title')

    click_button "Update Inproceeding"

    expect(page).to have_content "Inproceeding was successfully updated."
    expect(page).to have_content "Title: better title"
  end

  it "allows user to destroy inproceedings" do
    inproceeding = Inproceeding.new(reference: "INP03", author: "asd", title: "test", booktitle: "asd booktitle", year: 2000)
    expect(inproceeding).to be_valid
    inproceeding.save

    visit inproceedings_path

    click_link "Destroy"

    expect(page).to have_content("Inproceeding was successfully destroyed.")
    expect(page).not_to have_content("INP03")
  end

  it "generates reference automatically if field is left empty" do
    visit inproceedings_path

    click_link "New Inproceeding"

    fill_in('inproceeding_author', with: 'Sotilas Tähtien, LMAO AYYY')
    fill_in('inproceeding_title', with: 'In pumpkins')
    fill_in('inproceeding_booktitle', with: 'Avaruus ja puutarha')
    fill_in('inproceeding_year', with: '2080')

    click_button "Create Inproceeding"

    expect(page).to have_content("Inproceeding was successfully created.")

    click_link "Back"

    click_link "New Inproceeding"

    fill_in('inproceeding_author', with: 'Sotilas Tähtien, LMAO AYYY')
    fill_in('inproceeding_title', with: 'In pumpkins')
    fill_in('inproceeding_booktitle', with: 'Avaruus ja puutarha')
    fill_in('inproceeding_year', with: '2080')

    click_button "Create Inproceeding"

    expect(page).to have_content("Inproceeding was successfully created.")

    click_link "Back"

    click_link "New Inproceeding"

    fill_in('inproceeding_author', with: 'Sotilas Tähtien, LMAO AYYY')
    fill_in('inproceeding_title', with: 'In pumpkins')
    fill_in('inproceeding_booktitle', with: 'Avaruus ja puutarha')
    fill_in('inproceeding_year', with: '2080')

    click_button "Create Inproceeding"

    expect(page).to have_content("Inproceeding was successfully created.")

    click_link "Back"

    expect(page).to have_content("SL2080")
    expect(page).to have_content("SL2080a")
    expect(page).to have_content("SL2080b")
  end
end