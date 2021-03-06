class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def members
    @users = User.where(member: true).order(permission: :desc).order(first_name: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts @user.errors
    if @user.valid?
      @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if !(@user)
      redirect_to root_path
    end
  end

  def manage
    if current_user.permission < 5
      redirect_to root_path
    end
    @user = User.find_by(id: params[:id])
  end

  def override
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(super_user_params)
      if params[:user][:member] == 'true'
        @user.update_attributes(member: true)
      else
        @user.update_attributes(member: false)
      end
      @user.update_attributes(nickname: params[:user][:nickname])
      redirect_to @user
    else
      render :edit
    end
  end

  def edit_about
    @user = User.find_by(id: params[:id])
  end

  def update_about
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(about: params[user][about])
      redirect_to @user
    else
      render :edit_about
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def send_mail
    @user = User.find_by(email: "jonathanj.xu@yahoo.com")
    TeamMailer.single_mail(@user, "Email Subject")
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
      :password, :password_confirmation)
  end

  def super_user_params
    params.require(:user).permit(:first_name, :nickname, :last_name, :role,
     :password, :password_confirmation)
  end
end
