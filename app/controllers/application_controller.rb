class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def current_user
    if session[:email]
      @current_user ||= User.find(session[:email])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized?
      session[:email] == current_user.id
  end

end
