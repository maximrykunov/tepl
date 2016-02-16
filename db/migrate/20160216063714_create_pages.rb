class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :system_name
      t.string :title
      t.text :meta_keywords
      t.text :meta_description
      t.text :content

      t.timestamps null: false
    end
  end
end
