Given ("all required fields are filled") do
  @a = Article.new(reference:"ASD00", author:"asd", title:"test", journal:"asd journal", year:2000, volume:1)
end

When ("user tries to add citation") do
  @entries = Article.count;
  @a.save
end

Then ("new citation is added") do
  expect(Article.count).to be(@entries + 1)
end

Given ("field author is not filled") do
  @a = Article.new(reference:"ASD00", title:"test", journal:"asd journal", year:2000, volume:1)
end

Given ("field title is not filled") do
  @a = Article.new(reference:"ASD00", author:"test", journal:"asd journal", year:2000, volume:1)
end

Given ("field journal is not filled") do
  @a = Article.new(reference:"ASD00", author:"asd", title:"test", year:2000, volume:1)
  end

Given ("field year is not filled") do
  @a = Article.new(reference:"ASD00", author:"asd", journal:"asd journal", title:"test", volume:1)
end

Given("field volume is not filled") do
  @a = Article.new(reference:"ASD00", author:"asd", title:"test", journal:"asd journal", year:2000)
end

Given("field reference is not filled") do
  @a = Article.new(author:"asd", title:"test", journal:"asd journal", year:2000, volume:1)
end

Then ("new citation is not added") do
  expect(Article.count).to be(@entries)
end