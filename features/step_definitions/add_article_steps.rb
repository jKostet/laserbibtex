Given ("all required fields for article are filled") do
  @a = FactoryGirl.build(:article)
end

And ("articles field reference is in use") do
  FactoryGirl.create(:article)
end

When ("user tries to add article") do
  @entries = Article.count;
  @a.save
end

Then ("new article is added") do
  expect(Article.count).to be(@entries + 1)
end

Given ("articles field author is not filled") do
  @a = FactoryGirl.build(:article)
  @a.author = nil
end

Given ("articles field title is not filled") do
  @a = FactoryGirl.build(:article)
  @a.title = nil
end

Given ("articles field journal is not filled") do
  @a = FactoryGirl.build(:article)
  @a.journal = nil
  end

Given ("articles field year is not filled") do
  @a = FactoryGirl.build(:article)
  @a.year = nil
end

Given("articles field volume is not filled") do
  @a = FactoryGirl.build(:article)
  @a.volume = nil
end

Given("articles field reference is not filled") do
  @a = FactoryGirl.build(:article)
  @a.reference = nil
end

Then ("new article is not added") do
  expect(Article.count).to be(@entries)
end
