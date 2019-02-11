class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_app
  before_action :get_header_info

  def current_app
    @current_app ||= App.find_by(sub_domain: request.subdomain)
  end
  helper_method :current_app

  def get_app
    redirect_to root_url(subdomain: nil) unless current_app.present?
  end

  def get_header_info
    @top_categories = Category.where(parent_id: nil, app: current_app).visible.ordered
  end
end
