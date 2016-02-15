class PagesController < ApplicationController
  def index
  	@category_1 = Category.find_by(system_name: 'truba')
    @products_1 = Product.where(category: @category_1).ordered
  	@category_2 = Category.find_by(system_name: 'profil')
    @products_2 = Product.where(category: @category_2).ordered
  end
end
