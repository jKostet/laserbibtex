Given ("all required fields for book are filled") do
  @b = FactoryGirl.build(:book)
end

And ("books field reference is in use") do
  FactoryGirl.create(:book)
end

When ("user tries to add book") do
  @entries = Book.count
  @b.save
end

Then ("new book is added") do
  expect(Book.count).to be(@entries + 1)
end

Given ("books field reference is not filled") do
  @b = FactoryGirl.build(:book)
  @b.reference = nil
end

Given ("books field author is not filled") do
  @b = FactoryGirl.build(:book)
  @b.author = nil
end

Given ("books field title is not filled") do
  @b = FactoryGirl.build(:book)
  @b.title = nil
end

Given ("books field publisher is not filled") do
    @b = FactoryGirl.build(:book)
    @b.publisher = nil
end

Given "books field year is not filled" do
  @b = FactoryGirl.build(:book)
  @b.year = nil
end

Then ("new book is not added") do
  expect(Book.count).to be(@entries)
end
