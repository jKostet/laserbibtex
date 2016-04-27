class Article < ActiveRecord::Base
  include ModelToBib
  include GenerateReference

  validates :reference, presence: true, reference: true
  validates :author, presence: true
  validates :title, presence: true
  validates :journal, presence: true
  validates :year, presence: true
  validates :volume, presence: true
end
