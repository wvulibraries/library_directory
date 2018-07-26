# Floor Active Record Object for storing floors in buildings maps
#
# @author David J. Davis
# @data_model
# @since 0.0.1
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
