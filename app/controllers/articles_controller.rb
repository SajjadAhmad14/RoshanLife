class ArticlesController < ApplicationController
  before_action :set_user
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article created successfully!'
      redirect_to root_path
    else
      flash[:error] = 'No field should be empty!'
      # redirect_to new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id, :image, :user_id)
  end

  def set_user
    unless logged_in?
      flash[:error] = 'User must exist!'
      redirect_to login_path
    end
  end
end
