class Product < ApplicationRecord
  validates :code, :name, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
end
