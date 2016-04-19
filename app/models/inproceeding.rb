class Inproceeding < ActiveRecord::Base
  include ModelToBib

  validates :reference, presence: true
  validates :author, presence: true
  validates :title, presence: true
  validates :year, presence: true
end
