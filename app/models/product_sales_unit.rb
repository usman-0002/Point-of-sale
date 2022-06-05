class ProductSalesUnit < ApplicationRecord
  AVAILABILITY_TYPES = {
    unavailable: 0,
    unlimited:   1,
    limited:     2
  }.freeze

  belongs_to :product
  belongs_to :sales_unit

  validates :sales_unit_id, uniqueness: { scope: %i[sales_unit_id product_id] }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  enum order_availability: AVAILABILITY_TYPES, _prefix: true

  scope :code_filter, ->(search) { joins(:product).where('products.code ILIKE ? ', "%#{search}%") }
  scope :name_filter, ->(search) { joins(:product).where('products.name ILIKE ? ', "%#{search}%") }

  def self.filter(params)
    code_filter(params).or(name_filter(params))
  end
end
