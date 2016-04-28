ActiveAdmin.register Category do

  permit_params :name, :parent_id, :system_name, :description, :visible, :position

  around_filter do |controller, action|
    Category.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() id.to_s end
    end

    begin
      action.call
    ensure
      Category.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end
end
