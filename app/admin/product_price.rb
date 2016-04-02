ActiveAdmin.register ProductPrice do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :product_id, :sheet_id, :extend_count, :price

  def scoped_collection
    super.includes(:sheet).order('sheets.position')
  end

  index do
    selectable_column
    id_column
    column "Title" do |product_price|
      link_to product_price.title, admin_product_price_path(product_price)
    end
    column :price
    column :extend_count
    actions
  end

  controller do
    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

end
