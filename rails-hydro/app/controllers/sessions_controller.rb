class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      if params[:session][:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to user
    else
      flash.now[:danger] = "Invalid email or password"
      render 'new'
    end
  end
end
