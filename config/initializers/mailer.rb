ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address => "smtp.yandex.ru",
  :port => 587,
  :domain => 'medalak.ru',
  :authentication => :plain,
  :user_name => 'teplicy@medalak.ru',
  :password => ENV['MAIL_PASSWORD']
}