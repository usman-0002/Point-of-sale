class ProductsController < ApplicationController
  before_action :find_product, only: %i[show edit update destroy]
  def index
    @pagy, @products = pagy(Product.includes(:category))
    @categories = Category.all
    @suppliers = Supplier.all
  end

  def new
    @product = Product.new
    @categories = Category.all
    @suppliers = Supplier.all
  end

  def show; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product), notice: 'Product added Successfully!'
    else
      flash.now[:alert] = @product.errors.full_messages
      render :new
    end
  end

  def edit
    @categories = Category.all
    @suppliers = Supplier.all
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product updated Successfully!'
    else
      flash[:alert] = @product.errors.full_messages
      respond_to_js
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: 'Product deleted Successfully!'
    else
      redirect_to product_path(@product), alert: @product.errors.full_messages
    end
  end

  def search
    search_params = params.permit(:search)['search'].strip
    @pagy, @products = pagy(Product.filter(search_params))
    @categories = Category.all
    @suppliers = Supplier.all
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
