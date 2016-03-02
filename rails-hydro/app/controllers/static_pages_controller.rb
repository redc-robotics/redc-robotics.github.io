class StaticPagesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).limit(4)
    @nofix = true
  end
end
