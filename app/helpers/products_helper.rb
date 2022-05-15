module ProductsHelper
  def stock_status(stock)
    if stock > 10
      content_tag(:strong, 'Available', class: 'badge alert-success')
    elsif stock.zero?
      content_tag(:strong, 'Out of Stock', class: 'badge alert-danger')
    else
      content_tag(:strong, 'Limited', class: 'badge alert-warning')
    end
  end
end
