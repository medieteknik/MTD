class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :news
  has_and_belongs_to_many :companies
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # new function to set the password without knowing the current password used in our confirmation controller.
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted?
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  def password_match?
    self.errors[:password] << 'must be provided' if password.blank?
    self.errors[:password] << 'and confirmation do not match' if password != password_confirmation
    password == password_confirmation and !password.blank?
  end
end
