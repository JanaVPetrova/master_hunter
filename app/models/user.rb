class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email, email: true,
                    presence: true,
                    uniqueness: true

  validates :password_digest, presence: true
end
