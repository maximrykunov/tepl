# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  system_name    :string
#  brand_type     :string
#  price          :integer
#  image          :string
#  image_2        :string
#  width          :float
#  height         :float
#  length         :string
#  small_desc     :text
#  desc           :text
#  base_length    :float
#  base_weight    :float
#  base_price     :integer
#  base_cost      :integer
#  base_install   :integer
#  base_sheet     :integer
#  extend_length  :float
#  extend_weight  :float
#  extend_price   :integer
#  extend_cost    :integer
#  extend_install :integer
#  extend_sheet   :integer
#  position       :integer
#  div_weight     :float
#  div_price      :integer
#  div_cost       :integer
#  min_sheet_id   :integer
#  created_at     :datetime
#  updated_at     :datetime
#  category_id    :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
