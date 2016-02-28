class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_header_info

  def get_header_info
    Rails.logger.info "====#{ENV["MAIL_PASSWORD"]}"
    @categories = Category.where(parent_id: nil).ordered
  end
end
