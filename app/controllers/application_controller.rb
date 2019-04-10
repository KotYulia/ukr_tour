class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery

  def current_admin_user
    @current_admin_user ||= User.find(session[:user_admin_id]) if session[:user_admin_id].present?
  end

  def authenticate_admin_user!
    redirect_to login_url if current_admin_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  helper_method :current_user, :current_admin_user
end
