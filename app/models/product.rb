# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  system_name      :string
#  brand_type       :string
#  price            :integer
#  image            :string
#  image_2          :string
#  width            :float
#  height           :float
#  length           :string
#  small_desc       :text
#  desc             :text
#  base_length      :float
#  base_weight      :float
#  base_price       :integer
#  base_cost        :integer
#  base_install     :integer
#  base_sheet       :integer
#  extend_length    :float
#  extend_weight    :float
#  extend_price     :integer
#  extend_cost      :integer
#  extend_install   :integer
#  extend_sheet     :integer
#  position         :integer
#  div_weight       :float
#  div_price        :integer
#  div_cost         :integer
#  min_sheet_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  category_id      :integer
#  add_desc         :text
#  meta_keywords    :text
#  meta_description :text
#  product_type     :string
#

class Product < ActiveRecord::Base
  extend Enumerize

  belongs_to :category, inverse_of: :products
  belongs_to :min_sheet, class_name: 'Sheet', foreign_key: 'min_sheet_id'

  enumerize :product_type, in: [:tepl, :acc], default: :tepl, predicates: true, scope: true

  has_many :product_prices, dependent: :destroy
  has_many :manuals, dependent: :destroy
  has_many :images, as: :imageable

  scope :ordered, -> { order(:position) }
  scope :relative, -> (product) {
    Product.where.not(id: product.id).order("
    CASE
      WHEN product_type = 'acc' THEN '1'
      WHEN (product_type = 'tepl' AND category_id = #{product.category_id}) THEN '2'
      WHEN (product_type = 'tepl' AND category_id != #{product.category_id}) THEN '3'
    END")
  }

  def to_param
    "#{system_name.parameterize}"
  end

  def min_price(percent = 0, include_sheet = true)
    if tepl?
      result = base_price*(100-percent)/100
      result += min_sheet.price*base_sheet if include_sheet
    else
      result = price*(100-percent)/100
    end
    result
  end

  def full_base_price(extend_count, percent = 0)
    result = base_price + extend_count*extend_price
    result*(100-percent)/100
  end

  def full_install_price(extend_count)
    base_install + extend_count*extend_install
  end

  def full_price(extend_count, sheet, percent = 0)
    result = full_base_price(extend_count, percent)
    if sheet
      result = result + base_sheet*sheet.price + extend_count*extend_sheet*sheet.price
    end
    result
  end

  def full_product_price(extend_count, sheet, percent = 0)
    if prod_price = ProductPrice.find_by(product: self, sheet: sheet, extend_count: extend_count)
      return prod_price.price
    end
    full_price(extend_count, sheet, percent)
  end

  def sheets
    Sheet.where("id >= ?", min_sheet_id).ordered
  end

  def self.from_param(param)
    find_by_system_name(param)
  end

  def full_name(extend_count = 0, sheet = nil)
    result = "#{name} #{option_name(extend_count, sheet)}"
  end

  def url_name(extend_count = 0, sheet = nil)
    result = "#{system_name}_#{option_url_name(extend_count, sheet)}"
  end

  def option_name(extend_count, sheet = nil)
    result = "#{length.split(', ')[extend_count]} м"
    if sheet
      result += " (Каркас + поликарбонат #{sheet.short_name})"
    else
      result += " (Каркас)"
    end
    result
  end

  def option_url_name(extend_count, sheet = nil)
    result = "#{length.split(', ')[extend_count]}M"
    if sheet
      result += "_karkas_i_polycarbonat_#{sheet.system_name}"
    else
      result += "_karkas"
    end
    result
  end
end
