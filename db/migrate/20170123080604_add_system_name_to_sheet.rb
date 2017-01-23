class AddSystemNameToSheet < ActiveRecord::Migration
  def change
    add_column :sheets, :system_name, :string
  end
end
