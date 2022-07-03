class CategoriesController < ApplicationController
  def index
  end
  def new
    @category = Category.new
  end
  def show
    @category = Category.find_by(id: params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to category_url(@category)
    else
      render 'new'
    end
  end

  private 
  def category_params
    params.require(:category).permit(:name)
  end
end