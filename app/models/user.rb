class User < ApplicationRecord
  NUMBER = /\d[0-9]\)*\z/
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :f_name, presence: true, length: { maximum: 10 }
  validates :l_name, presence: true, length: { maximum: 10 }
  validates :reg_no, presence: true
  validates :email, presence: true, length: { maximum: 26 }, format:
    { with: REGEX }
  validates :password, presence:true, length: { minimum: 6 }
  validates :phone, presence:true, format: { with:NUMBER }
  has_secure_password
end
