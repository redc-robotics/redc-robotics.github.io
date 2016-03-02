class StaticPagesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).limit(3)
    @nofix = true
  end
end
