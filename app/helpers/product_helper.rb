module ProductHelper

  def product_weight(product, extend_count)
    begin
      weight = product.base_weight + extend_count*product.extend_weight
      "~ #{weight} кг"
    rescue
    end
  end

  def product_sheet_name(product, sheet)
    if sheet.link
      link_to sheet.short_name, sheet.link
    else
      sheet.short_name
    end
  end

  def product_detail_header(product, extend_count, sheet)
    # p "===#{length}===="
    # result = product.option_name(length, sheet)
    result = "#{product.length.split(', ')[extend_count]} м"
    p "===#{result}===="
    if sheet
      result += " (Каркас + поликарбонат #{product_sheet_name(product, sheet)})"
    else
      result += " (Каркас)"
    end
    result.html_safe
  end

  def product_min_price(product)
    min_price = product.min_price
    if product_price = ProductPrice.where(product_id: product.id, sheet_id: product.min_sheet_id).first
      price = product_price.price
    else
      price = min_price
    end
    "#{price} рублей"
  end

  def product_min_base_price(product)
    "#{product.full_base_price(0)} рублей"
  end

end
