class User < ApplicationRecord
  NUMBER = /\d[0-9]\)*\z/
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :f_name, presence: true, length: { maximum: 10 }
  validates :l_name, presence: true, length: { maximum: 10 }
  validates :reg_no, presence: true
  validates :email, presence: true, length: { maximum: 26 }, format:
    { with: REGEX }, uniqueness:true
  validates :password, presence:true, length: { minimum: 6 }
  validates :phone, presence:true, format: { with:NUMBER }
  has_secure_password
  SCHOOL = ["Computing", "Medicine", "Maths"]

  def User.digest(string)
    cost  = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                   BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end 
  def name
    [f_name, l_name].join(' ')
  end
end
