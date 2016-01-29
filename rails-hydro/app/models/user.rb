class User < ActiveRecord::Base
  attr_accessor :auth_token
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password

  before_create { generate_token(:auth_token) }
  before_save :set_defaults

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64
    return self[column]
  end

  def remember

  end

  def forget
    update_attribute(:auth_token, nil)
  end

  def set_defaults
    self.member ||= false
    self.permission ||= 0
  end
end
