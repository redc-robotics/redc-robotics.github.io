class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def login(user)
    session[:user_id] = user.id
  end

  protect_from_forgery with: :exception
end
