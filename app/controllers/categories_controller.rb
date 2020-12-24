class CategoriesController < ApplicationController
  before_action :require_admin
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

  private

  def categrory_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = 'Only admin can perform action!'
      redirect_to root_path
    end
  end
end

