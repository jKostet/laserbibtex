class CreateInproceedings < ActiveRecord::Migration
  def change
    create_table :inproceedings do |t|
      t.string :reference
      t.string :author
      t.string :title
      t.string :booktitle
      t.string :editor
      t.integer :volume
      t.integer :number
      t.string :series
      t.string :pages
      t.string :address
      t.string :organization
      t.string :publisher
      t.integer :year
      t.integer :month
      t.string :note

      t.timestamps null: false
    end
  end
end
