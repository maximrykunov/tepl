class AddAppToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :app_id, :integer
    Category.update_all(app_id: App.find_by(sub_domain: 'teplicy').id)
  end
end
