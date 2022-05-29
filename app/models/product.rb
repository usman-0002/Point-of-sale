class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_one_attached :avatar, dependent: :destroy
  has_many :product_sales_units, dependent: :destroy

  validates :code, :name, presence: true
  validates :code, uniqueness: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  default_scope ->{ order(created_at: :desc) }
  scope :code_filter, ->(search) { where('code ILIKE ?', "%#{search}%") }
  scope :name_filter, ->(search) { where('name ILIKE ?', "%#{search}%") }
  scope :des_filter, ->(search) { where('description ILIKE ?', "%#{search}%") }

  def self.filter(params)
    code_filter(params).or(name_filter(params)).or(des_filter(params))
  end

  def avatar_url
    avatar.attached? ? avatar : 'product.jpg'
  end
end
