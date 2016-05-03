require 'rails_helper'

describe "All references page" do
  let(:article) { FactoryGirl.build(:article) }
  let(:book) { FactoryGirl.create(:book) }
  let(:inproceeding) { FactoryGirl.build(:inproceeding) }

  it "should not have anything before something has been created" do
    visit references_path

    expect(page).to have_content 'LASER-BibTeX'
    expect(page).to have_content 'All'
    expect(page).to have_content 'reference'
    expect(page).to have_content 'author'
    expect(page).to have_content 'title'

    expect(page).not_to have_content("2016")
  end

  it "lists added objects correctly" do
    expect(article).to be_valid
    article.save

    expect(book).to be_valid
    book.save

    expect(inproceeding).to be_valid
    inproceeding.save

    visit references_path

    expect(page).to have_content 'A2016'
    expect(page).to have_content 'B2016'
    expect(page).to have_content 'ville vallaton'
    expect(page).to have_content 'puffet on hyvää'
    expect(page).to have_content 'purjojen sielunelämä'
  end

end

describe "All reference page shows correct tag information" do
  let(:article_with_tags) { FactoryGirl.build(:article_with_tags) }
  let(:book_with_tags) { FactoryGirl.build(:book_with_tags) }
  let(:inproceeding_with_tags) { FactoryGirl.build(:inproceeding_with_tags) }

  it "lists added objects correctly" do
    expect(article_with_tags).to be_valid
    article_with_tags.save

    expect(book_with_tags).to be_valid
    book_with_tags.save

    expect(inproceeding_with_tags).to be_valid
    inproceeding_with_tags.save

    visit references_path

    save_and_open_page

    expect(page).to have_content 'A2016'
    expect(page).to have_content 'B2016'
    expect(page).to have_content 'ville vallaton'
    expect(page).to have_content 'puffet on hyvää'
    expect(page).to have_content 'purjojen sielunelämä'

    expect(page).to have_content 'jaatelo runsas'
    expect(page).to have_content 'spirulina ruokainen'
    expect(page).to have_content 'raikas fresh'
  end
end
