class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    if !(@article)
      redirect_to root_path
    end
  end

  def edit
    @user = current_user
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
