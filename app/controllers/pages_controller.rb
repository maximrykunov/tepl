# == Schema Information
#
# Table name: pages
#
#  id               :integer          not null, primary key
#  system_name      :string
#  title            :string
#  meta_keywords    :text
#  meta_description :text
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class PagesController < ApplicationController
  def index
  	@category_1 = Category.find_by(system_name: 'truba')
    # @products_1 = Product.where(category: @category_1).ordered
  	@category_2 = Category.find_by(system_name: 'profil')
    # @products_2 = Product.where(category: @category_2).ordered
  end

  def show
    @page = Page.from_param(params[:id])
    p "===#{@page.nil?}"
    render '/shared/404', :status => 404 if @page.nil?
  end
end
