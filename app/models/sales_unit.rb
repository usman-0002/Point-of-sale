class SalesUnit < ApplicationRecord
  has_many :product_sales_units
  has_many :products, through: :product_sales_units

  validates :name, :abbreviation, presence: true, uniqueness: {case_sensitive: false}
end
