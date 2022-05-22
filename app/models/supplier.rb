class Supplier < ApplicationRecord
  has_one :supplier_detail, class_name: 'UserDetail', as: :detailable, dependent: :destroy
end
