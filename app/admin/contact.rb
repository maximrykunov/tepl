ActiveAdmin.register Contact do

  permit_params :name, :phone, :email, :contact_type, :message, :option

end
