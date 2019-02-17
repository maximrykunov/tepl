class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_app
  before_action :get_header_info

  def current_app
    return @current_app if defined? @current_app

    sub_domain = request.subdomain
    # Временно пока нет остновного лендинга
    sub_domain = 'teplicy' if sub_domain.empty?
    p "====#{sub_domain}"
    @current_app ||= App.find_by(sub_domain: sub_domain)
  end
  helper_method :current_app

  def get_app
    redirect_to root_url(subdomain: nil) unless current_app.present?
  end

  def get_header_info
    @top_categories = Category.where(parent_id: nil, app: current_app).visible.ordered
  end
end
