module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  #def current_user
  #  user ||= User.find_by(id: session[:user_id])
  #  user
  #end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
    @current_user
  end

  def logged_in?
    !(current_user.nil?)
  end
end
