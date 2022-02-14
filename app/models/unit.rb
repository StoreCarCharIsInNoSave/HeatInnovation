class Unit < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, length: { minimum: 5 ,maximum: 25 }
  validates :description, presence: true, length: { minimum: 5 ,maximum: 100 }
  validates :big_desc, presence: true, length: { minimum: 30 ,maximum: 10000 }
  validates :address, presence: true, length: { minimum: 3 ,maximum: 50 }
  validates :leader, presence: true, length: { minimum: 3 ,maximum: 50 }
  phoneRegex= /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
  validates :leader_phone, presence: true, length: { minimum: 10 ,maximum: 14 }, format: { with: phoneRegex }
  validates :legal_phone, presence: true, length: { minimum: 10 ,maximum: 14 }, format: { with: phoneRegex }
end
