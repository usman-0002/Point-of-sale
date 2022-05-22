class UserDetail < ApplicationRecord
  belongs_to :detailable, polymorphic: true
  has_one_attached :avatar, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def full_name
    first_name + ' ' + last_name
  end
  
  def avatar_url
    avatar.attached? ? avatar : 'parties_default_img.jpg'
  end
end
