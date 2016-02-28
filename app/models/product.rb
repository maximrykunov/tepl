# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  system_name    :string
#  brand_type     :string
#  price          :integer
#  image          :string
#  image_2        :string
#  width          :float
#  height         :float
#  length         :string
#  small_desc     :text
#  desc           :text
#  base_length    :float
#  base_weight    :float
#  base_price     :integer
#  base_cost      :integer
#  base_install   :integer
#  base_sheet     :integer
#  extend_length  :float
#  extend_weight  :float
#  extend_price   :integer
#  extend_cost    :integer
#  extend_install :integer
#  extend_sheet   :integer
#  position       :integer
#  div_weight     :float
#  div_price      :integer
#  div_cost       :integer
#  min_sheet_id   :integer
#  created_at     :datetime
#  updated_at     :datetime
#  category_id    :integer
#

class Product < ActiveRecord::Base
  belongs_to :category, inverse_of: :products
  belongs_to :min_sheet, class_name: 'Sheet', foreign_key: 'min_sheet_id'

  scope :ordered, -> { order(:position) }

  def to_param
    "#{system_name.parameterize}"
  end

  def price
    base_price + min_sheet.price*base_sheet
  end

  def full_base_price(extend_count)
    base_price + extend_count*extend_price
  end

  def full_install_price(extend_count)
    base_install + extend_count*extend_install
  end

  def full_price(extend_count, sheet)
    full_base_price(extend_count) + base_sheet*sheet.price + extend_count*extend_sheet*sheet.price
  end

  def sheets
    Sheet.where("id >= ?", min_sheet_id).ordered
  end

  def self.from_param(param)
    find_by_system_name(param)
  end
end
