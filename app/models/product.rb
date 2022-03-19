class Product < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy

  validates :code, :name, presence: true
  validates :code, uniqueness: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
end
