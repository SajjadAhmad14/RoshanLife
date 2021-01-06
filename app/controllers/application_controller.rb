class ApplicationController < ActionController::Base
  helper_method :popular_article, :recent_article, :list_categories,
                :homepage_background, :article_info, :truncate_body
  
  def list_categories
    Category.all.order(priority: :desc)
  end

  def popular_article
    Article.where(votes_count: Article.maximum(:votes_count)).first
  end

  def recent_article(category)
    category.articles.last
  end

  def already_voted?(article)
    current_user.votes.pluck(:article_id).include?(article.id)
  end

  def homepage_background
    render partial: 'article_back' unless popular_article.nil?
  end

  def article_info
    render partial: 'article_container' if @articles.exists?
  end

  def truncate_body(article)
    article.body.split.first(6).join(' ')
  end
end
