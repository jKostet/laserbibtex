class Article < ActiveRecord::Base
  validates :reference, presence: true
  validates :author, presence: true
  validates :title, presence: true
  validates :journal, presence: true
  validates :year, presence: true
  validates :volume, presence: true
end
