class Inproceeding < ActiveRecord::Base
  include ModelToBib
  include GenerateReference

  validates :reference, presence: true, reference: true
  validates :author, presence: true
  validates :title, presence: true
  validates :booktitle, presence: true
  validates :year, presence: true
end
