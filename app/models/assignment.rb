class Assignment < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  default_scope -> { where("due_date IS NULL OR due_date > ?", Time.now)  }
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

  def self.by_letter(letter)
    Assignment.where( "lecturer LIKE?", "#{letter}%")
  end
end
