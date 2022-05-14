class CategoriesController < ApplicationController
  def new
    @category = Category.new
    respond_to do |format|
      format.js
      format.html
    end
  end
end
