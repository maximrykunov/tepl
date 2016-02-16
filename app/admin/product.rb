ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :system_name, :brand_type, :price, :image, :image_2, :width, :height, :length,
  :small_desc, :desc, :base_length, :base_weight, :base_price, :base_cost, :base_install, :base_sheet,
  :extend_length, :extend_weight, :extend_price, :extend_cost, :extend_install, :extend_sheet, :position,
  :div_weight, :div_price, :div_cost, :min_sheet_id, :category_id
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
    column :system_name
    column :brand_type
    actions
  end

  around_filter do |controller, action|
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
