ActiveAdmin.register Article do
  permit_params :system_name, :title, :meta_keywords, :meta_description, :content, :visible, :images_attributes => [:id,:image,:_destroy]

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :system_name
    column :visible
    # column :images do |article|
    #   lis = ((article.images.map { |i|
    #       "<li>#{ image_tag i.image_url :small }</li>"
    #   }).join("")).html_safe
    #   "<ul class='suit_items_tn_table'>#{lis}</ul>".html_safe
    # end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :system_name
      f.input :meta_keywords, :input_html => { :rows => 3 }
      f.input :meta_description, :input_html => { :rows => 3 }
      if Rails.env.development?
        f.input :content, as: :ckeditor
      else
        f.input :content
      end

      f.inputs "Дополнительные изображения" do
        f.has_many :images, :allow_destroy => true do |obj_image|
          if obj_image.object.new_record?
            obj_image.input :image,
                      :as => :file,
                      :hint => obj_image.template.image_tag(obj_image.object.image)

          else
            obj_image.template.image_tag obj_image.object.image_url(:small)
          end
        end
      end

      # f.input :images, as: :file, input_html: { multiple: true }
      # f.inputs "Gallery" do
      #   f.semantic_fields_for :images do |fi|
      #     fi.input :image, :as => :file
      #     # fi.template.image_tag(fi.object.image.url(:thumb)) 
      #     # fi.input :image_cache, :as => :hidden 
      #     # if fi.object.image? 
      #     #   fi.input :remove_image, :as => :boolean 
      #     # end 
      #   end
      # end
      f.input :visible
    end

    actions
  end
end
