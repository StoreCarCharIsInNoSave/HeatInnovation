class Question < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w(answered waiting closet) }
  before_save :set_status

  def set_status
    self.status = 'answered' if answer.present?
  end

  def answered?
    self.status == "answered"
  end

  def waiting?
    self.status == "waiting"
  end

  def closet?
    self.status == "closet"
  end

end
