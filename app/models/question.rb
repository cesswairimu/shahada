class Question < ApplicationRecord
validates :title, presence: true, length: {maximum: 100}
validates :body, presence: true
validates :category, presence:true
validates :tag, presence:true
has_many :answers

  CAT= ["Networking", "Programming", "Database", "Calculus", "Medicine", "Statistics"]
end
