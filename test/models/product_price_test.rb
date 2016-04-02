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

require 'test_helper'

class ProductPriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
