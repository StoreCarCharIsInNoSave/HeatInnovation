class Worker < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, length: { minimum: 3,maximum: 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex } , uniqueness: true
  validates :position, presence: true, length: { minimum: 3,maximum: 20 }
end
