class AddColumnTagsToInproceeding < ActiveRecord::Migration
  def change
    add_column :inproceedings, :tags, :string
  end
end
