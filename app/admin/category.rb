ActiveAdmin.register Category do

  permit_params :name, :parent_id, :system_name, :description, :visible, :position

end
