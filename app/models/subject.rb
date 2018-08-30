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
  has_many :subjectables, dependent: :nullify
  has_many :employees, through: :subjectables
end
