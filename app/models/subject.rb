# Subject for liasons
#
# @author David J. Davis
# @data_model
# @since 0.0.1
class Subject < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { within: 3..50 }

  # association
  belongs_to :subjectable, polymorphic: true
end
