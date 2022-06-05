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

  def stock_color(stock)
    if stock > 10
      content_tag(:div, "#{stock} Items Left", class: 'badge alert-success')
    elsif stock.zero?
      content_tag(:div, 'Out of Stock', class: 'badge alert-danger')
    elsif stock == 1
      content_tag(:div, "#{stock} Item Left", class: 'badge alert-warning')
    else
      content_tag(:div, "#{stock} Items Left", class: 'badge alert-warning')
    end
  end
end
