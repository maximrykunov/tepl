# == Schema Information
#
# Table name: parniks
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
#

require 'test_helper'

class ParnikTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
