class CategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update destroy]
  def index
    @categories = Category.includes(:products)
  end

  def new
    @category = Category.new
    respond_to_js
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category added Successfully!'
    else
      flash[:alert] = @category.errors.full_messages
    end
    redirect_to categories_path
  end

  def edit
    respond_to_js
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category updated Successfully!'
    else
      flash[:alert] = @category.errors.full_messages
    end
    redirect_to categories_path
  end

  def destroy
    if @category.destroy
      flash[:notice] = 'Category deleted Successfully!'
    else
      flash[:alert] = @category.errors.full_messages
    end
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit!
  end

  def respond_to_js
    respond_to do |format|
      format.js
    end
  end
end
