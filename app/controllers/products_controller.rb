class ProductsController < ApplicationController
  before_action :find_product, only: %i[update destroy]
  def index
    @pagy, @products = pagy(Product.all)
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
      flash[:notice] = 'Product updated Successfully!'
      redirect_to products_path
    else
      flash.now[:alert] = @product.errors.full_messages
      respond_to do |format|
        format.js
      end
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
    respond_to do |format|
      format.js
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit!
  end
end
