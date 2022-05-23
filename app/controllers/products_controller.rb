class ProductsController < ApplicationController
  before_action :find_product, only: %i[update destroy]
  def index
    @pagy, @products = pagy(Product.includes(:category))
    @categories = Category.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product added Successfully!'
    else
      flash.now[:alert] = @product.errors.full_messages
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product updated Successfully!'
    else
      flash.now[:alert] = @product.errors.full_messages
      respond_to_js
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = 'Product deleted Successfully!'
    else
      flash[:alert] = 'Unable to delete this product!'
    end
    redirect_to products_path
  end

  def search
    search_params = params.permit(:search)['search'].strip
    @pagy, @products = pagy(Product.filter(search_params))
    @categories = Category.all
    respond_to_js
  end

  def create_new_category
    category_params = params.require(:category).permit(:name)
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_product_path, notice: 'Category added Successfully!'
    else
      flash[:alert] = @category.errors.full_messages
      respond_to_js
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit!
  end

  def respond_to_js
    respond_to do |format|
      format.js
    end
  end
end
