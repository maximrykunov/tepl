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
    @category_1 = Category.find_by(system_name: 'teplicy_volya_profil')
    @category_2 = Category.find_by(system_name: 'teplicy_volya_truba')
  end

  def show
    @page = Page.from_param(params[:id])
    if @page.nil?
      @category_1 = Category.find_by(system_name: 'teplicy_volya_profil')
      @category_2 = Category.find_by(system_name: 'teplicy_volya_truba')
      render '/shared/404', :status => 404
    end
  end

  def market
    respond_to do |format|
      format.xml
    end
  end
end
