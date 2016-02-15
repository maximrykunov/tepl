class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.string :system_name
      t.text :description
      t.boolean :visible, default: true
      t.integer :position, default: 100

      t.timestamps null: false
    end
  end
end
