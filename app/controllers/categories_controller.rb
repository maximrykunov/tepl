# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  parent_id   :integer
#  system_name :string
#  description :text
#  visible     :boolean          default(TRUE)
#  position    :integer          default(100)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoriesController < ApplicationController
  def show
    @category = Category.from_param(params[:id])
    p "===#{@category.nil?}"
    render '/shared/404', :status => 404 if @category.nil?
  end
end
