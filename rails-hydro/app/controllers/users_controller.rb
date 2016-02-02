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
    @user = User.find_by(id: params[:id])
  end

  def override
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(super_user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(super_user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
      :password, :password_confirmation)
  end

  def super_user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end
end
