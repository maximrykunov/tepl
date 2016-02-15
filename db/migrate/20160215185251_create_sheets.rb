class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :name
      t.integer :price
      t.integer :cost
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
