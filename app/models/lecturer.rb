class Lecturer < ApplicationRecord
  before_create :create_activation
  before_save :downcase_email
  NUMBER = /\d[0-9]\)*\z/
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :f_name, presence: true, length: { maximum: 10 }
  validates :l_name, presence: true, length: { maximum: 10 }
  validates :id_no, presence: true
  validates :email, presence: true, length: { maximum: 26 }, format:
    { with: REGEX }, uniqueness:true
  validates :password, presence:true, length: { minimum: 6 }
  validates :phone, presence:true, format: { with:NUMBER }
  has_secure_password
  SCHOOL = ["Computing", "Medicine", "Maths"]
  has_many :assignments

  def name
    [f_name, l_name].join(' ')
  end

  private
  def create_activation
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def downcase_email
    self.email = email.downcase
  end

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # Returns a random token.
  def new_token
  SecureRandom.urlsafe_base64
  end
end
