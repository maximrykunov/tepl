# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  system_name :string
#  brand_type  :string
#  price       :integer
#  image       :string
#  image_2     :string
#  width       :string
#  length      :string
#  height      :string
#  small_desc  :text
#  desc        :text
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#

class Product < ActiveRecord::Base
  belongs_to :category, inverse_of: :products

  def to_param
    "#{system_name.parameterize}"
  end

  def self.from_param(param)
    find_by_system_name!(param)
  end
end
