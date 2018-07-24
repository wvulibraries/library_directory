# Building Active Record Object for storing the directories buildings
#
# @author David J. Davis
# @data_model
# @since 0.0.1
class Address < ApplicationRecord
  # association
  belongs_to :addressable, polymorphic: true

  # validations
  validates :line1, length: { within: 0..50 }
  validates :line2, length: { within: 0..50 }
  validates :city, length: { within: 0..60 }
  validates :state, length: { within: 0..50 }
  validates :zip, length: { within: 0..20 }
end
