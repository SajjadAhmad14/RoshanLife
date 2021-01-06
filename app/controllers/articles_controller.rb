class ArticlesController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: %i[new create]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article published successfully!'
      redirect_to root_path
    else
      redirect_to new_article_path
      flash[:error] = @article.errors.full_messages.to_sentence
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
    redirect_to login_path unless logged_in?
  end
end
