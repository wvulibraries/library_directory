class Employee < User
  validates :job_title, presence: true, length: { within: 2..70 }
  validates :university_classification, presence: true, length: { within: 2..70 }

  validates :description, length: { maximum: 500 }

  # associations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :departments, as: :departmentable

  # concerns
  include Imageable
end
