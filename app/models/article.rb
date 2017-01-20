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

class Article < ActiveRecord::Base
  belongs_to :product

  scope :active, -> { where(visible: true) }
  # scope :ordered, -> { order(:position) }

  def to_param
    "#{system_name.parameterize}"
  end

  def self.from_param(param)
    find_by(system_name: param)
  end
end
