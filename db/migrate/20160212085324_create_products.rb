class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :system_name
      t.string :brand_type
      t.integer :price
      t.string :image
      t.string :image_2
      t.string :width
      t.string :length
      t.string :height
      t.text :small_desc
      t.text :desc

      t.timestamps
    end
  end
end
