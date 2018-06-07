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
#  option       :string
#

class Contact < ApplicationRecord

  phony_normalize :phone, default_country_code: 'RU'

  validates :name, presence: true
  validates :phone, presence: true,  length: { minimum: 10 }
end
