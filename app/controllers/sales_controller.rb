class SalesController < ApplicationController
  def new
    @pagy, @product_sales_units = pagy(ProductSalesUnit.includes(:product, :sales_unit), items: 15)
  end

  def search
    search_params = params.permit(:search)['search'].strip
    @pagy, @product_sales_units = pagy(ProductSalesUnit.filter(search_params), items: 15)
    respond_to do |format|
      format.js
    end
  end
end
