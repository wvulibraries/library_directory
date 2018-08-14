# Employee
#
# @description: A sub class of the user model uses single table inheritance to
# determine type of profile and add extra details to user model
# @author David J. Davis
# @data_model
# @since 0.0.1
class Employee < User
  # validations
  validates :job_title,
            presence: true,
            length: { within: 2..70 }

  validates :university_classification,
            presence: true,
            length: { within: 2..70 }

  validates :description, length: { maximum: 500 }

  # associations
  belongs_to :department
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :subjects, as: :subjectable, dependent: :destroy

  # concerns
  include Imageable
end
