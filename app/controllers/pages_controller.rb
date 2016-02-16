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
  	@category_1 = Category.find_by(system_name: 'teplicy_volya_truba')
  	@category_2 = Category.find_by(system_name: 'teplicy_volya_profil')
  end

  def show
    @page = Page.from_param(params[:id])
    render '/shared/404', :status => 404 if @page.nil?
  end
end
