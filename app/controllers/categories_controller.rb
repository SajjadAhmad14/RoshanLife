class CategoriesController < ApplicationController
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
      flash[:notice] = @category.errors.full_messages
      render 'new'
    end
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
  end

  private

  def categrory_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless logged_in? && current_user.admin
      redirect_to root_path
      flash[:error] = 'Only admin can perform this action!'
    end
  end
end