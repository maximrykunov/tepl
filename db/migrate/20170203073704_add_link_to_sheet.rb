class AddLinkToSheet < ActiveRecord::Migration
  def change
    add_column :sheets, :link, :string
  end
end
