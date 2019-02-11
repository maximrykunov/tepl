ActiveAdmin.register App do

  permit_params :name, :sub_domain

  index do
    selectable_column
    column :name
    column :sub_domain
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :sub_domain
    end

    actions
  end

end
