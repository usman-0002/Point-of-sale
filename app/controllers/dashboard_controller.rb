class DashboardController < ApplicationController
  def dashboard
    @products_count = Product.count
  end
end
