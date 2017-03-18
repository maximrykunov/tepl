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
    @articles = Article.active
  end

  def show
    @page = Page.friendly.find(params[:id])
    @title = "#{@page.title.gsub('"','')}."
    @meta_keywords = "#{@page.meta_keywords.gsub('"','')}, #{APP_CONFIG['meta_keywords_tail']}"
    @meta_description = "#{@page.meta_description.gsub('"','')} #{APP_CONFIG['meta_description_tail']}"
    rescue ActiveRecord::RecordNotFound => e
      @category_1 = Category.find_by(system_name: 'teplicy_volya_profil')
      @category_2 = Category.find_by(system_name: 'teplicy_volya_truba')
      render '/shared/404', :status => 404
  end

  def market
    respond_to do |format|
      format.xml
    end
  end
end
