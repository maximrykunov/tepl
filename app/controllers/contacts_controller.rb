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
#

class ContactsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      send_email
      result = { "result" => "success", "cls" => "c_success", "time" => "", "message" => "Спасибо, сообщение отправлено"}
    else
      result = { "result" => "error", "cls" => "c_error", "time" => "", "message" => "Ошибка. #{@contact.errors.full_messages}"}
    end
    render json: result.to_json
  end

  private

  def send_email
    ContactMailer.call_back_mail(@contact)
  end

  def contact_params
    new_params = {}
    params["cs"].each_with_index do |v, i|
      new_params[:name] = params["os"][i] if v.strip == 'Имя'
      new_params[:phone] = params["os"][i] if v.strip == 'Номер телефона'
      new_params[:message] = params["os"][i] if v.strip == 'Комментарий'
      new_params[:contact_type] = params["os"][i] if v.strip == 'contact_type'
    end
    new_params
  end
end
