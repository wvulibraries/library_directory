# Library Departments
#
# @author David J. Davis
# @data_model
# @since 0.0.1
class Department < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { within: 5..50 }

  validates :description,
            length: { maximum: 500 }

  # associations
  belongs_to :departmentable, polymorphic: true
end
