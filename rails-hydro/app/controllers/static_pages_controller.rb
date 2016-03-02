class StaticPagesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).limit(3)
    @nofix = true
  end

  def dashboard
  	if not logged_in?
  		redirect_to login_path
  	end
  end
end
