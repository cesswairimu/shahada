class Assignment < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates :attachment, presence: true
  belongs_to :lecturer
  validate :future
  validates :title, presence:true
  validates :unit_code, presence:true
  validates :due_date, presence:true

  def future
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Can't be in the past")
    end
  end    
end
