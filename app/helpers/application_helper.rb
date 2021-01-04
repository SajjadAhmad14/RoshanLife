module ApplicationHelper
  def check_article(category)
    render partial: 'article_title', locals: { category: category } if category.articles.exists?
  end
end
