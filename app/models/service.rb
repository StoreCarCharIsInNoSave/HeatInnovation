class Service < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, length: { minimum: 15, maximum: 25 }
  validates :description, presence: true, length: { minimum: 15, maximum: 250 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
