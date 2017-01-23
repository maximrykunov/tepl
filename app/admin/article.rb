ActiveAdmin.register Article do

  permit_params :system_name, :title, :meta_keywords, :meta_description, :content, :visible

  index do
    selectable_column
    id_column
    column :title
    column :system_name
    column :visible
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :system_name
      f.input :meta_keywords
      f.input :meta_description
      f.input :content, as: :rich, config: { :width => '76%', :height => '400px' }
      f.input :visible
    end

    actions
  end
end
