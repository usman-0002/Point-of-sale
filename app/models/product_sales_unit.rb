class ProductSalesUnit < ApplicationRecord
  AVAILABILITY_TYPES = {
    unavailable: 0,
    unlimited:   1,
    limited:     2
  }.freeze

  belongs_to :product
  belongs_to :sales_unit

  validates :sales_unit_id, uniqueness: { scope: %i[sales_unit_id product_id] }
  validates :quantity, :unit_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum order_availability: AVAILABILITY_TYPES, _prefix: true
end
