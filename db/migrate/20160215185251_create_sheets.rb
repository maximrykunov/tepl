class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :name
      t.string :short_name
      t.integer :price
      t.integer :cost
      t.text :description
      t.string :image
      t.integer :position

      t.timestamps null: false
    end
  end
end
