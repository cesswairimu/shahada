class Assignment < ApplicationRecord
  belongs_to :lecturer
  validates :lecturer_id, presence: true
end
