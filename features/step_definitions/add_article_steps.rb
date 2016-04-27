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
  @a = Article.new(reference:"ASD00", title:"test", journal:"asd journal", year:2000, volume:1)
end

Given ("articles field title is not filled") do
  @a = Article.new(reference:"ASD00", author:"test", journal:"asd journal", year:2000, volume:1)
end

Given ("articles field journal is not filled") do
  @a = Article.new(reference:"ASD00", author:"asd", title:"test", year:2000, volume:1)
  end

Given ("articles field year is not filled") do
  @a = Article.new(reference:"ASD00", author:"asd", journal:"asd journal", title:"test", volume:1)
end

Given("articles field volume is not filled") do
  @a = Article.new(reference:"ASD00", author:"asd", title:"test", journal:"asd journal", year:2000)
end

Given("articles field reference is not filled") do
  @a = Article.new(author:"asd", title:"test", journal:"asd journal", year:2000, volume:1)
end

Then ("new article is not added") do
  expect(Article.count).to be(@entries)
end
