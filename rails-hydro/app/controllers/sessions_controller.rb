class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      if params[:session][:remember_me] == '1'
        remember(user)
        #cookies.permanent[:auth_token] = user.auth_token
      else
        forget(user)
        #cookies[:auth_token] = user.auth_token
      end
      redirect_to user
    else
      flash.now[:danger] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
