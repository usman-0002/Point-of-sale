class SalesUnitsController < ApplicationController
  before_action :find_sales_unit, only: %i[edit update destroy]
  def index
    @sales_units = SalesUnit.includes(:products)
  end

  def new
    @sales_unit = SalesUnit.new
    respond_to_js
  end

  def create
    @sales_unit = SalesUnit.new(sales_unit_params)
    if @sales_unit.save
      flash[:notice] = 'Unit created successfully'
    else
      flash[:alert] = @sales_unit.errors.full_messages
    end
    redirect_to sales_units_path
  end

  def edit
    respond_to_js
  end

  def update
    if @sales_unit.update(sales_unit_params)
      flash[:notice] = 'Unit created successfully'
    else
      flash[:alert] = @sales_unit.errors.full_messages
    end
    redirect_to sales_units_path
  end


  def destroy
    if @sales_unit.products.blank?
      if @sales_unit.destroy
        flash[:notice] = 'Unit deleted Successfully!'
      else
        flash[:alert] = @sales_unit.errors.full_messages
      end
    else
      flash[:alert] = 'Unit has association in multiple products'
    end
    redirect_to sales_units_path
  end

  private

  def sales_unit_params
    params.require(:sales_unit).permit(:name, :abbreviation)
  end

  def respond_to_js
    respond_to do |format|
      format.js
    end
  end

  def find_sales_unit
    @sales_unit = SalesUnit.find(params[:id])
  end
end
