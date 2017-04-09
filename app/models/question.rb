class Question < ApplicationRecord
validates :title, presence: true, length: {maximum: 100}
validates :body, presence: true
validates :category, presence:true
validates :tag, presence:true

  CAT= ["Networking", "Programming", "Database", "Calculus", "Medicine", "Statistics"]
end
