class Book < ActiveRecord::Base
  include ModelToBib
  include GenerateReference

  validates :reference, presence: true, reference: true
  validates :author, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
end
