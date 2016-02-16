class CategoriesController < ApplicationController
  def show
    @category = Category.from_param(params[:id])
    p "===#{@category.nil?}"
    render '/shared/404', :status => 404 if @category.nil?
  end
end
