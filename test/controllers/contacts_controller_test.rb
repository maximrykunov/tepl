# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  name         :string
#  phone        :string
#  email        :string
#  contact_type :string
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
