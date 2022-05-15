module ApplicationHelper
  include Pagy::Frontend
  def display_sidebar(controller_name)
    controller_name.include?('home') ||
      controller_name.include?('products') ||
      controller_name.include?('categories')
  end

  def hide_products_submenu(controller_name)
    controller_name.include?('products') ||
      controller_name.include?('categories')
  end
end
