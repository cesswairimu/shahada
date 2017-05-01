class Assignment < ApplicationRecord
  belongs_to :lecturer
  validates :lecturer_id, presence: true
  validate :future


  def future
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Can't be in the past")
    end
  end    
end
