# == Schema Information
#
# Table name: manuals
#
#  id          :integer          not null, primary key
#  name        :string
#  product_id  :integer
#  manual_type :integer
#  url         :string
#  visible     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ManualTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
