# == Schema Information
#
# Table name: sheets
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :integer
#  cost        :integer
#  description :text
#  image       :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end