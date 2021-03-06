class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path if !logged_in?
  end

  def require_user_signup
    redirect_to signup_path if !logged_in?
  end

  def hide_from_user
    redirect_to root_path if logged_in?
  end

  def belongs_to_current_user?(obj)
    current_user == obj.user ? true : false
  end

  def deny_access(obj)
    redirect_to root_path if !belongs_to_current_user?(obj)
  end
end
