class UserRegistrationType < User
  include ApplicationType

  validates :password, presence: true
  validates :email, presence: true, email: true
  validates :name, presence: true

  permit :email, :password, :name
end
