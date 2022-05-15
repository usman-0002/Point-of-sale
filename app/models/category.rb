class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(:created_at) }
end
