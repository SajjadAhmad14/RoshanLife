class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :popular_article
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : false
  end

  def logged_in?
    !!current_user
  end

  def popular_article
    Article.where(votes_count: Article.maximum(:votes_count)).first
  end
end