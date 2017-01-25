class CreateManuals < ActiveRecord::Migration
  def change
    create_table :manuals do |t|
      t.string :name
      t.references :product, index: true
      t.integer :manual_type
      t.string :url
      t.boolean :visible

      t.timestamps null: false
    end
    add_foreign_key :manuals, :products
  end
end
