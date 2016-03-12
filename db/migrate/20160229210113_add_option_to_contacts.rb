class AddOptionToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :option, :string
  end
end
