class CategoriesController < ApplicationController
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
end

