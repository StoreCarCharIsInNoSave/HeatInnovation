class Question < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w(answered waiting closet) }


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
