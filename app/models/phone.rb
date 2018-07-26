# Building Active Record Object for storing the directories buildings
#
# @author David J. Davis
# @data_model
# @since 0.0.1
class Phone < ApplicationRecord
  # validation
  validates :number,
            presence: true,
            length: { within: 10..30 }
  # enums types
  enum number_types: %i[campus home fax mobile]

  # associations
  belongs_to :phoneable, polymorphic: true
end
