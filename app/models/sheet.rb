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
#

class Sheet < ActiveRecord::Base
  scope :ordered, -> { order(:position) }

  def self.lowest
    @lowest = Sheet.order(price: :asc).first
  end
end
