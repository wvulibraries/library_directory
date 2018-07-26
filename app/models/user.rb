class User < ApplicationRecord
  # validation
  validates :first_name, presence: true, length: { within: 2..70 }
  validates :last_name, presence: true, length: { within: 2..70 }
  validates :wvu_username, presence: true, length: { within: 7..70 }

  validates :email, presence: true
  validate  :valid_email
  
  # associations

  # enums
  enum status: %i[active disabled]
  enum role: %i[basic admin]

  # concerns

  # custom methods

  def display_name
    if middle_name.nil? || middle_name.empty?
      "#{first_name} #{last_name}"
    else
      "#{first_name} #{middle_name} #{last_name}"
    end
  end

  # custom validations
  def valid_email
    email_regex = !!(email =~ /^[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.edu/i)
    errors.add :email, 'Email must be a valid WVU email.' unless email_regex
  end
end
