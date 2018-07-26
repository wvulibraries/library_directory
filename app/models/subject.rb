class Subject < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { within: 3..50 }

  # association
  belongs_to :subjectable, polymorphic: true
end
