class CategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update destroy]
  def index
    @categories = Category.includes(:products)
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category added Successfully!'
    else
      flash.now[:alert] = @category.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category updated Successfully!'
    else
      flash.now[:alert] = @category.errors.full_messages
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = 'Category deleted Successfully!'
    else
      flash[:alert] = 'Unable to delete this Category!'
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
end
