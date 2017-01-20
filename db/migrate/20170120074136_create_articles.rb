class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :product, index: true
      t.string :system_name
      t.string :title
      t.boolean :visible, default: false
      t.text :meta_keywords
      t.text :meta_description
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :articles, :products
  end
end
