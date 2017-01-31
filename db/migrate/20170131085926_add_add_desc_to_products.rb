class AddAddDescToProducts < ActiveRecord::Migration
  def change
    add_column :products, :add_desc, :text
    add_column :products, :meta_keywords, :text
    add_column :products, :meta_description, :text
  end
end
