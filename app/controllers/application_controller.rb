class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :popular_article, :recent_article, :already_voted?, :list_categories,
                :homepage_background, :article_info
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : false
  end

  def logged_in?
    current_user ? true : false
  end

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
end
