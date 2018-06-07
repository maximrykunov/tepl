# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  parent_id   :integer
#  system_name :string
#  description :text
#  visible     :boolean          default(TRUE)
#  position    :integer          default(100)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  has_many :products, inverse_of: :category
  belongs_to :parent, class_name: "Category"
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  scope :ordered, -> { order(:position) }
  scope :visible, -> { where(visible: true) }

  def to_param
    "#{system_name.parameterize}"
  end

  def parent_name
    # it may not have a parent
    parent.try(:name)
  end

  def has_parent?
    parent.present?
  end

  def has_children?
    children.exists?
  end

  def self.from_param(param)
    find_by_system_name(param)
  end
end
