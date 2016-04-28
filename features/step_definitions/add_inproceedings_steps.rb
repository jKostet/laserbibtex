Given "all required fields for inproceedings are filled" do
  @in = FactoryGirl.build(:inproceeding)
end

And ("inproceedings field reference is in use") do
  FactoryGirl.create(:inproceeding)
end

When "user tries to add inproceedings" do
  @entries = Inproceeding.count
  @in.save
end

Then "new inproceedings is added" do
  expect(Inproceeding.count).to be(@entries + 1)
end

Given "inproceedings field reference is not filled" do
  @in = FactoryGirl.build(:inproceeding)
  @in.reference = nil
end

Given "inproceedings field author is not filled" do
  @in = FactoryGirl.build(:inproceeding)
  @in.author = nil
end

Given "inproceedings field title is not filled" do
  @in = FactoryGirl.build(:inproceeding)
  @in.title = nil
end

Given "inproceedings field booktitle is not filled" do
  @in = FactoryGirl.build(:inproceeding)
  @in.booktitle = nil
end

Given "inproceedings field year is not filled" do
  @in = FactoryGirl.build(:inproceeding)
  @in.year = nil
end

Then "new inproceedings is not added" do
  expect(Inproceeding.count).to be(@entries)
end
