# == Schema Information
#
# Table name: product_prices
#
#  id           :integer          not null, primary key
#  product_id   :integer
#  sheet_id     :integer
#  extend_count :integer
#  price        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ProductPrice < ActiveRecord::Base
  belongs_to :product
  belongs_to :sheet

  validates :product_id, uniqueness: {scope: [:sheet_id, :extend_count]}

  def title
    "#{product.name} #{product.length.split(', ')[extend_count]} м #{sheet.short_name}"
  end
end
