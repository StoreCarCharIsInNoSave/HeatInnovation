class Review < ApplicationRecord
  belongs_to :user
  validates :mark, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { minimum: 5, maximum: 100 }
end
