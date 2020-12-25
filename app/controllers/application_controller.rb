class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :article_max
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : false
  end

  def logged_in?
    !!current_user
  end

  def article_max
    Article.order('votes_coun
      t desc').limit(1)
  end
end