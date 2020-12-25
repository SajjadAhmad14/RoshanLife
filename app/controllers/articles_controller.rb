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
      render :new
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
    if !(logged_in?)
      flash[:error] = 'You must log in to create article'
      redirect_to login_path
    end
  end

end
