Given ("all required fields are filled") do
  @a = Article.new(author:"asd", title:"test", journal:"asd journal", year:2000, volume:1)
end

When ("user tries to add citation") do
  @a.save
end

Then ("new citation is added") do
  article = Article.find_by_title "test"
  article.should == @a
end

Given ("field author is not filled") do
  @a = Article.new(title:"test", journal:"asd journal", year:2000, volume:1)
end

Given ("field title is not filled") do
  @a = Article.new(author:"test", journal:"asd journal", year:2000, volume:1)
end

Given ("field journal is not filled") do
  @a = Article.new(author:"asd", title:"test", year:2000, volume:1)
  end

Given ("field year is not filled") do
  @a = Article.new(author:"asd", journal:"asd journal", title:"test", volume:1)
end

Given("field volume is not filled") do
  @a = Article.new(author:"asd", title:"test", journal:"asd journal", year:2000)
end

Then ("new citation is not added") do
  Article.all.length.should == 0
end