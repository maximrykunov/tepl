# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  system_name      :string
#  title            :string
#  visible          :boolean          default(FALSE)
#  meta_keywords    :text
#  meta_description :text
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
