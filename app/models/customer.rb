class Customer < ApplicationRecord
  has_one :customer_detail, class_name: 'UserDetail', as: :detailable, dependent: :destroy

  scope :first_name_filter, lambda { |search|
    joins(:customer_detail)
      .where('user_details.first_name ILIKE ?', "%#{search}%")
  }
  scope :last_name_filter, lambda { |search|
    joins(:customer_detail)
      .where('user_details.last_name ILIKE ?', "%#{search}%")
  }
  scope :name_filter, ->(search) { first_name_filter(search).or(last_name_filter(search)) }
end
