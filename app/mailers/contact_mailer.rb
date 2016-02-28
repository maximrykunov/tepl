class ContactMailer < ApplicationMailer
  default from: 'teplicy@medalak.ru'
 
  def call_back_mail(contact)
    @contact = contact
    mail(to: 'teplicy@medalak.ru', subject: 'Обратный звонок')
  end
end
