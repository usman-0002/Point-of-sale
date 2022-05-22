class Employee < ApplicationRecord
  before_create do
    self.joined_at = Date.today unless joined_at
  end

  has_one :employee_detail, class_name: 'UserDetail', as: :detailable, dependent: :destroy
end
