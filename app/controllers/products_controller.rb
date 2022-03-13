class ProductsController < ApplicationController
  def index
    @products = Product.order('created_at')
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product added Successfully!'
    else
      render :new, alert: 'failed to add product!'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit!
  end
end
