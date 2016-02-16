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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
