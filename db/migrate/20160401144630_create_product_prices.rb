class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.references :product, index: true
      t.references :sheet, index: true
      t.integer :extend_count
      t.integer :price

      t.timestamps null: false
    end
    add_foreign_key :product_prices, :products
    add_foreign_key :product_prices, :sheets
  end
end
