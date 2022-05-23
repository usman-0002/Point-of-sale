module ApplicationHelper
  include Pagy::Frontend
  def display_sidebar(controller_name)
    controller_name.include?('home') ||
      controller_name.include?('products') ||
      controller_name.include?('categories') ||
      controller_name.include?('customers') ||
      controller_name.include?('employees')
  end

  def hide_products_submenu(controller_name)
    controller_name.include?('products') ||
      controller_name.include?('categories')
  end

  def hide_parties_submenu(controller_name)
    controller_name.include?('customers') ||
    controller_name.include?('employees')
  end

  def form_submit_btn_text(action)
    action.include?('create') ? 'Add' : 'Update'
  end
end
