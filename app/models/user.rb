# User Class
#
# @author David J. Davis
# @concern
# @since 0.0.1
class User < ApplicationRecord
  # validation
  validates :first_name, presence: true, length: { within: 2..70 }
  validates :last_name, presence: true, length: { within: 2..70 }
  validates :wvu_username, presence: true, length: { within: 7..70 }

  validates :email, presence: true
  validate  :valid_email

  # associations

  # enums
  enum status: %i[disabled enabled]
  enum role: %i[basic admin]

  # custom methods
  def display_name
    if preferred_name.blank?
      [prefix, first_name, middle_name, last_name, suffix].join(' ')
    else
      [prefix, preferred_name, middle_name, last_name, suffix].join(' ')
    end
  end

  def admin?
    role == 'admin' && status? == true
  end

  def status?
    status == 'enabled'
  end

  # custom validations
  def valid_email
    email_regex = !!(email =~ /^[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.edu/i)
    errors.add :email, 'must be a valid WVU email.' unless email_regex
  end
end
