ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :system_name, :brand_type, :price, :image, :image_2, :width, :height, :length,
  :small_desc, :desc, :base_length, :base_weight, :base_price, :base_cost, :base_install, :base_sheet,
  :extend_length, :extend_weight, :extend_price, :extend_cost, :extend_install, :extend_sheet, :position,
  :div_weight, :div_price, :div_cost, :min_sheet_id, :category_id, :add_desc, :meta_keywords, :meta_description,
  :product_type
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
    column :product_type
    column :brand_type
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :min_sheet
      f.input :name
      f.input :system_name
      f.input :product_type
      f.input :brand_type
      f.input :meta_keywords, :input_html => { :rows => 3 }
      f.input :meta_description, :input_html => { :rows => 3 }
      f.input :price
      f.input :image
      f.input :image_2
      f.input :width
      f.input :height
      f.input :length
      f.input :small_desc, :input_html => { :rows => 5 }
      f.input :desc, as: :ckeditor
      f.input :add_desc, as: :ckeditor
      f.input :base_length
      f.input :base_weight
      f.input :base_price
      f.input :base_cost
      f.input :base_install
      f.input :base_sheet
      f.input :extend_length
      f.input :extend_weight
      f.input :extend_price
      f.input :extend_cost
      f.input :extend_install
      f.input :extend_sheet
      f.input :position
      f.input :div_weight
      f.input :div_price
      f.input :div_cost
      # if Rails.env.development?
      #   f.input :content, as: :ckeditor
      # else
      #   f.input :content
      # end
    end

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
