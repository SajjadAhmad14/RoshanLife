class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article created successfully!'
      redirect_to @article
    else
      render :new
    end
  end
  
end
