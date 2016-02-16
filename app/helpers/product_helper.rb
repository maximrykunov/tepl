module ProductHelper

  def product_weight(product, extend_count)
    weight = product.base_weight + extend_count*product.extend_weight
    "~ #{weight} кг"
  end

end
