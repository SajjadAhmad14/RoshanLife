module ApplicationHelper
  def checkArticle(category)
    render partial: 'article_title', locals: { category: category } if category.articles.exists?
  end
end


