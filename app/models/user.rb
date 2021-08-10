class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key

  validates :email, uniqueness: true, presence: true
  validates :api_key, uniqueness: true
  validates :password_digest, presence: true
end
