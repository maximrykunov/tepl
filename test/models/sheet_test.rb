# == Schema Information
#
# Table name: sheets
#
#  id          :integer          not null, primary key
#  name        :string
#  short_name  :string
#  price       :integer
#  cost        :integer
#  description :text
#  image       :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  system_name :string
#

require 'test_helper'

class SheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
