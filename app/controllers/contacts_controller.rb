# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  name         :string
#  phone        :string
#  email        :string
#  contact_type :string
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  option       :string
#

class ContactsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    params[:o] ||= '0-0-0-0'
    @contact = Contact.new(contact_type: 'order', option: params[:o])
    load_options
    if @product
      @title = "#{@product.name} - оставить заявку. #{APP_CONFIG['default_title_tail']}"
      @meta_keywords = "#{@product.name}, #{APP_CONFIG['meta_keywords_tail']}"
      @meta_description = "#{@product.name} #{APP_CONFIG['meta_description_tail']}"
    end
  end

  def create
    if params[:contact][:contact_type] == 'order'
      @contact = Contact.new(contact_order_params)

      if @contact.save
        send_email
      else
        load_options
        render :new
      end
    else
      @contact = Contact.new(contact_callback_params)

      if @contact.save
        send_email
        result = { "result" => "success", "cls" => "c_success", "time" => "", "message" => "Спасибо, сообщение отправлено"}
      else
        result = { "result" => "error", "cls" => "c_error", "time" => "", "message" => "Ошибка. #{@contact.errors.full_messages}"}
      end
      render json: result.to_json
    end
  end

  private

  def send_email
    ContactMailer.call_back_mail(@contact).deliver
  end

  def contact_order_params
    new_params = {}
    new_params[:name] = params[:contact][:name]
    new_params[:phone] = params[:contact][:phone]
    new_params[:message] = params[:contact][:message]
    new_params[:contact_type] = params[:contact][:contact_type]
    new_params[:option] = params[:contact][:option]
    new_params
  end

  def contact_callback_params
    new_params = {}
    params["cs"].each_with_index do |v, i|
      new_params[:name] = params["os"][i] if v.strip == 'Имя'
      new_params[:phone] = params["os"][i] if v.strip == 'Номер телефона'
      new_params[:message] = params["os"][i] if v.strip == 'Комментарий'
      new_params[:contact_type] = params["os"][i] if v.strip == 'contact_type'
    end
    new_params
  end

  def load_options
    options = @contact.option.split('-')

    @product = Product.find_by(id: options[0]) || Product.first
    @sheet = Sheet.find_by(id: options[1])
    @length = options[2].to_i
    @install = options[3].to_i
  end
end
