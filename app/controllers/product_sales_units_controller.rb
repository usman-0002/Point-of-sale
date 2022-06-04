class ProductSalesUnitsController < ApplicationController
  before_action :find_sales_unit, only: %i[edit update destroy]
  def new
    @product = Product.find(params[:product_id])
    @sales_units = SalesUnit.all
    @product_sales_unit = @product.product_sales_units.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @product_sales_unit = @product.product_sales_units.new(sales_unit_params)
    if @product_sales_unit.save
      flash[:notice] = 'Unit added Successfully!'
    else
      flash[:alert] = @product_sales_unit.errors.full_messages
    end
    redirect_to product_path(@product)
  end

  def edit
    @sales_units = SalesUnit.all
    respond_to do |format|
      format.js
    end
  end

  def update
    if @product_sales_unit.update(sales_unit_params)
      flash[:notice] = 'Unit updated Successfully!'
    else
      flash[:alert] = @product_sales_unit.errors.full_messages
    end
    redirect_to product_path(@product_sales_unit.product)
  end

  def destroy
    if @product_sales_unit.destroy
      flash[:notice] = 'Unit deleted Successfully!'
    else
      flash[:alert] = 'Unable to delete this Unit!'
    end
    redirect_to product_path(@product_sales_unit.product)
  end

  private

  def sales_unit_params
    params.require(:product_sales_unit)
          .permit(:sales_unit_id, :unit_price, :order_availability, :quantity)
  end

  def find_sales_unit
    @product_sales_unit = ProductSalesUnit.find(params[:id])
  end
end
