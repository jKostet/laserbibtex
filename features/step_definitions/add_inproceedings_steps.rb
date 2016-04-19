Given "all required fields for inproceedings are filled" do
  @in = Inproceeding.new(reference:"ASD16", author:"pirjospiruliina", title:"asdasd", booktitle:"hellurei", year:2016)
end

When "user tries to add inproceedings" do
  @entries = Inproceeding.count
  @in.save
end

Then "new inproceedings is added" do
  expect(Inproceeding.count).to be(@entries + 1)
end

Given "inproceedings field reference is not filled" do
  @in = Inproceeding.new(author:"pirjospiruliina", title:"asdasd", booktitle:"hellurei", year:2016)
end

Given "inproceedings field author is not filled" do
  @in = Inproceeding.new(reference:"ASD16", title:"asdasd", booktitle:"hellurei", year:2016)
end

Given "inproceedings field title is not filled" do
  @in = Inproceeding.new(reference:"ASD16", author:"pirjospiruliina", booktitle:"hellurei", year:2016)
end

Given "inproceedings field booktitle is not filled" do
  @in = Inproceeding.new(reference:"ASD16", author:"pirjospiruliina", title:"asdasd", year:2016)
end

Given "inproceedings field year is not filled" do
  @in = Inproceeding.new(reference:"ASD16", author:"pirjospiruliina", title:"asdasd", booktitle:"hellurei")
end

Then "new inproceedins is not added" do
  expect(Inproceeding.count).to be(@entries)
end
