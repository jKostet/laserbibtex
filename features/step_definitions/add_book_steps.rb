Given ("all required fields for book are filled") do
  @b = Book.new(reference:"ASD00", author:"pirjo", title:"purjot pirjon ruokavaliossa", publisher:"asdasd", year:2000)
end

When ("user tries to add book") do
  @entries = Book.count
  @b.save
end

Then ("new book is added") do
  expect(Book.count).to be(@entries + 1)
end

Given ("books field reference is not filled") do
  @b = Book.new(author:"pirjo", title:"purjot pirjon ruokavaliossa", publisher:"asdasd", year:2000)
end

Given ("books field author is not filled") do
  @b = Book.new(reference:"ASD00", title:"purjot pirjon ruokavaliossa", publisher:"asdasd", year:2000)
end

Given ("books field title is not filled") do
  @b = Book.new(reference:"ASD00", author:"pirjo", publisher:"asdasd", year:2000)
end

Given ("books field publisher is not filled") do
  @b = Book.new(reference:"ASD00", author:"pirjo", title:"purjot pirjon ruokavaliossa", year:2000)
end

Given "books field year is not filled" do
  @b = Book.new(reference:"ASD00", author:"pirjo", title:"purjot pirjon ruokavaliossa", publisher:"asdasd")
end

Then ("new book is not added") do
  expect(Book.count).to be(@entries)
end
