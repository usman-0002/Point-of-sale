module CategoriesHelper
  def form_submit_btn_text(action)
    action.include?('create') ? 'Add Category' : 'Update Category'
  end
end
