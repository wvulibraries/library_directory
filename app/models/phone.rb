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
