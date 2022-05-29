module ApplicationHelper
  include Pagy::Frontend
  def display_sidebar(controller_name)
    controller_name.include?('home') ||
      controller_name.include?('products') ||
      controller_name.include?('categories') ||
      controller_name.include?('customers') ||
      controller_name.include?('employees') ||
      controller_name.include?('suppliers') || 
      controller_name.include?('sales_units')
  end

  def hide_items_submenu(controller_name)
    controller_name.include?('products') ||
      controller_name.include?('categories') ||
      controller_name.include?('sales_units')
  end

  def hide_parties_submenu(controller_name)
    controller_name.include?('customers') ||
    controller_name.include?('employees') ||
    controller_name.include?('suppliers')
  end

  def form_submit_btn_text(action)
    action.include?('create') ? 'Add' : 'Update'
  end
end
