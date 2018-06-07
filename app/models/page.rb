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

class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :system_name

  # def self.from_param(param)
  #   find_by_system_name(param)
  # end
end
