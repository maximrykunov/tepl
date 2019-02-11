class AddAppToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :app_id, :integer
    Category.update_all(app_id: App.find_by(sub_domain: 'teplicy').id)
  end
end
