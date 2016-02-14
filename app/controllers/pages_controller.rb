class PagesController < ApplicationController
  def index
    @products_1 = Product.all.where(brand_type: 'volya_1')
    @products_2 = Product.all.where(brand_type: 'volya_2')
  end
end
