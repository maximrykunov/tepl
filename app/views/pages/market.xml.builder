xml.instruct!
xml.declare! :DOCTYPE, :yml_catalog, :SYSTEM, "shops.dtd"
xml.yml_catalog( date: "#{Date.today.to_s} 0:01") do
  xml.shop do
    xml.name "Теплицы Медалак"
    xml.company "ИП Кузовлев Сергей Владимирович"
    xml.url "http://teplicy.medalak.ru/"

    xml.currencies do
      xml.currency(id:"RUR", rate: "1")
    end

    xml.categories do
      xml.category("Товары для дома и дачи", id: "54422")
      xml.category("Дача, сад и огород", id: "54495", parentId: "54422")
      xml.category("Товары для садоводства и озеленения", id: "60699", parentId: "54495")
      xml.category("Теплицы и парники", id: "55099", parentId: "60699")
    end



    xml.offers do
      products = Product.where(system_name: 'strelka')
      products.each do |product|
        # каркас
        product.length.split(', ').each_with_index do |size, idx|
          xml.offer(id: "#{product.id}0#{idx}0", available: "true") do
            xml.url product_detail_url(product, option: "#{product.url_name(idx)}-#{product.id}-0-#{idx}-0")
            xml.price "#{product.full_base_price(idx)}"
            xml.currencyId "RUR"
            xml.categoryId "55099"
            xml.picture image_url(product.image) 
            xml.picture image_url(product.image_2) 
            xml.name "#{product.full_name(idx)}"
            xml.model "#{product.system_name}-#{product.id}-0-#{idx}-0"
            xml.vendor "Воля"
            xml.description "#{product.name}. ширина: #{product.width} м, высота: #{product.height} м, длина: #{size} м. Покрытие приобретается отдельно!"
            xml.age "0"
            xml.delivery "false"
            xml.pickup "true"
            xml.sales_notes "бесплатная доствка первые 100 км от Дубны"
            xml.manufacturer_warranty "true"
            xml.country_of_origin "Россия"
          end
        end
        # каркас + полик
        product.sheets.each do |sheet|
          product.length.split(', ').each_with_index do |size, idx|
            xml.offer(id: "#{product.id}#{sheet.id}#{idx}0", available: "true") do
              xml.url product_detail_url(product, option: "#{product.url_name(idx, sheet)}-#{product.id}-#{sheet.id}-#{idx}-0")
              xml.price "#{product.full_product_price(idx, sheet)}"
              xml.currencyId "RUR"
              xml.categoryId "55099"
              xml.picture image_url(product.image) 
              xml.picture image_url(product.image_2) 
              xml.name "#{product.full_name(idx, sheet)}"
              xml.model "#{product.system_name}-#{product.id}-#{sheet.id}-#{idx}-0"
              xml.vendor "Воля"
              xml.description "#{product.name}. ширина: #{product.width} м, высота: #{product.height} м, длина: #{size} м. Покрытие: поликарбонат #{sheet.short_name}"
              xml.age "0"
              xml.delivery "false"
              xml.pickup "true"
              xml.sales_notes "бесплатная доствка первые 100 км от Дубны"
              xml.manufacturer_warranty "true"
              xml.country_of_origin "Россия"
            end
          end
        end
      end
    end

  end
end