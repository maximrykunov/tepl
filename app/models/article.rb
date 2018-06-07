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

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :system_name

  belongs_to :product
  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, :allow_destroy => true

  scope :active, -> { where(visible: true) }
  # scope :ordered, -> { order(:position) }

  # def to_param
  #   "#{system_name.parameterize}"
  # end

  # def self.from_param(param)
  #   find_by(system_name: param)
  # end
end
