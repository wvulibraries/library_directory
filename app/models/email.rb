# Email Active Record Object for storing the email address for Department Contacts
#
# @author Tracy A. McCormick
# @data_model
# @since 0.0.1
class Email < ApplicationRecord
  # validation  
  validates :address, presence: true
  validate  :valid_address

  # associations  
  belongs_to :emailable, polymorphic: true

  # custom validations
  def valid_address
    address_regex = !!(address =~ /^[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.edu/i)
    errors.add :address, 'must be a valid WVU email.' unless address_regex
  end  
end
