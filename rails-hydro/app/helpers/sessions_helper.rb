module SessionsHelper
  def current_user
    user ||= User.find_by(id: session[:user_id])
    user
  end

  def logged_in?
    !(current_user.nil?)
  end
end
