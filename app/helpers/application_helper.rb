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

end
