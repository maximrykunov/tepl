class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :system_name
      t.string :brand_type
      t.integer :price
      t.string :image
      t.string :image_2
      t.float :width
      t.float :height
      t.string :length
      t.text :small_desc
      t.text :desc
      t.float :base_length
      t.float :base_weight
      t.integer :base_price
      t.integer :base_cost
      t.integer :base_install
      t.integer :base_sheet
      t.float :extend_length
      t.float :extend_weight
      t.integer :extend_price
      t.integer :extend_cost
      t.integer :extend_install
      t.integer :extend_sheet
      t.integer :position
      t.float :div_weight
      t.integer :div_price
      t.integer :div_cost
      t.integer :min_sheet_id

      t.timestamps
    end
  end
end
