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
#  link        :string
#

class Sheet < ApplicationRecord
  scope :ordered, -> { order(:position) }

  has_many :product_prices, dependent: :destroy


  def self.lowest
    @lowest = Sheet.order(price: :asc).first
  end
end
