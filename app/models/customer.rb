class Customer < ApplicationRecord
  has_one :customer_detail, class_name: 'UserDetail', as: :detailable, dependent: :destroy
end
