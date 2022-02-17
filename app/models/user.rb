class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :reviews
  has_many :questions
  has_one_attached :avatar
  def admin?
    self.is_admin
  end
end