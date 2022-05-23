class Supplier < ApplicationRecord
  has_one :supplier_detail, class_name: 'UserDetail', as: :detailable, dependent: :destroy

  validates :company_name, presence: true

  scope :first_name_filter, lambda { |search|
    joins(:supplier_detail)
      .where('user_details.first_name ILIKE ?', "%#{search}%")
  }
  scope :last_name_filter, lambda { |search|
    joins(:supplier_detail)
      .where('user_details.last_name ILIKE ?', "%#{search}%")
  }
  scope :name_filter, ->(search) { first_name_filter(search).or(last_name_filter(search)) }
end
