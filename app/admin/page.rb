ActiveAdmin.register Page do

  permit_params :system_name, :title, :meta_keywords, :meta_description, :content

  index do
    selectable_column
    id_column
    column :title
    column :system_name
    actions
  end

end
