class CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :require_admin, except: [:show]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categrory_params)
    if @category.save
      flash[:notice] = 'Category created successfully!'
      redirect_to root_path
    else
      redirect_to new_category_path
      flash[:error] = @category.errors.full_messages.to_sentence
    end
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
    @articles = @category.articles.includes(:votes).order(created_at: :desc)
  end

  private

  def categrory_params
    params.require(:category).permit(:name)
  end

  def require_admin
    redirect_to root_path unless logged_in? && current_user.admin?
  end
end
