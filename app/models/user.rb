class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :reviews
  has_many :questions
  has_one_attached :avatar
  def admin?
    self.is_admin
  end

  def set_admin
    self.is_admin = true
    self.save
  end

  def unset_admin
    self.is_admin = false
    self.save
  end
end