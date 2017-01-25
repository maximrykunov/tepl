# == Schema Information
#
# Table name: manuals
#
#  id          :integer          not null, primary key
#  name        :string
#  product_id  :integer
#  manual_type :integer
#  url         :string
#  visible     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Manual < ActiveRecord::Base
  enum manual_type: [:manual, :video, :panorama]
  
  belongs_to :product

  scope :active, -> { where(visible: true) }
  scope :ordered, -> { order(:name) }
end
