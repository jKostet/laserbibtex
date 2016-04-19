class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :reference
      t.string :author
      t.string :title
      t.string :publisher
      t.integer :volume
      t.integer :number
      t.string :series
      t.string :address
      t.string :edition
      t.integer :year
      t.integer :month
      t.string :note

      t.timestamps null: false
    end
  end
end
