class Employee < ApplicationRecord
  before_create do
    self.joined_at = Date.today unless joined_at
  end

  has_one :employee_detail, class_name: 'UserDetail', as: :detailable, dependent: :destroy

  validates :job_title, presence: true

  scope :first_name_filter, lambda { |search|
    joins(:employee_detail)
      .where('user_details.first_name ILIKE ?', "%#{search}%")
  }
  scope :last_name_filter, lambda { |search|
    joins(:employee_detail)
      .where('user_details.last_name ILIKE ?', "%#{search}%")
  }
  scope :name_filter, ->(search) { first_name_filter(search).or(last_name_filter(search)) }
end
