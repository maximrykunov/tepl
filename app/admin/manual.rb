ActiveAdmin.register Manual do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :product_id, :manual_type, :url, :visible
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    selectable_column
    id_column
    column :name
    column :manual_type
    column :product
    column :visible
    actions
  end

  around_action do |controller, action|
    Product.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() id.to_s end
    end

    begin
      action.call
    ensure
      Product.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end
end
