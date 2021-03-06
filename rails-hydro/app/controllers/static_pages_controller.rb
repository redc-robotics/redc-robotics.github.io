class StaticPagesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).limit(3)
    @nofix = true
  end

  def about
  end

  def dashboard
  	if not logged_in?
  		redirect_to login_path
  	end
    @user = current_user
  end

  def work
    @nofix = true
  end
end
