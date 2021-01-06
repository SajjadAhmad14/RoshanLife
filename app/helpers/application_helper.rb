module ApplicationHelper  
  def logged_in?
    current_user ? true : false
  end

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : false
  end

  def check_article(category)
    render partial: 'article_title', locals: { category: category } if category.articles.exists?
  end

  def already_voted?(article)
    current_user.votes.pluck(:article_id).include?(article.id)
  end

  def show_vote(article)
    render partial: 'votes/vote_form', locals: { article: article } if logged_in? && !already_voted?(article)
  end

  def login_link
    render partial: 'layouts/login' unless logged_in? 
  end

  def register_link
    render partial: 'layouts/register' unless logged_in? 
  end

  def category_link
    render partial: 'layouts/category_create' if logged_in? && current_user.admin?
  end

  def article_link
    render partial: 'layouts/article_create' if logged_in? && !current_user.admin?
  end

  def logout_link
    render partial: 'layouts/logout' if logged_in?
  end

  def show_msg(key, msg)
    if flash[:error]
      render partial: 'layouts/flash_error', locals: { key: key, msg: msg }
    else
      render partial: 'layouts/flash_success', locals: { key: key, msg: msg }
    end
  end

end
