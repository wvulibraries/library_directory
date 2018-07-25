class Floor < ApplicationRecord
  # associations
  belongs_to :building

  # validation
  validates :name,
            presence: true,
            length: { within: 3..50 },
            uniqueness: { case_sensitive: false }

  # concerns
  include Imageable
end
