class User < ActiveRecord::Base
  attr_accessor :auth_token
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64
    return self[column]
  end
end
