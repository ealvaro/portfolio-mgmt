class ApplicationController < ActionController::Base
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?

  def authenticate_user!
    if session[:user_id] && current_user
    else
      session[:return_to] = request.path
      redirect_to new_session_path, warning: "Please sign in to carry on"
    end
  end

  hide_action :authenticate_user!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    @current_user
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def redirect_user
    redirect_to '/404'
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
