class UserSignInType
  include ApplicationTypeWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true,
                    email: true
  validates :password, presence: true
  validate :check_authentification

  def user
    User.find_by_email email
  end

  private
  def check_authentification
    if !user.try(:authenticate, password)
      errors.add(:password, :user_or_password_invalid)
    end
  end
end