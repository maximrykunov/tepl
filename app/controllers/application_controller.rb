class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_header_info

  def get_header_info
    @top_categories = Category.where(parent_id: nil).visible.ordered
  end
end
