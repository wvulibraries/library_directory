# Building Active Record Object for storing the directories buildings
#
# @author David J. Davis
# @data_model
# @since 0.0.1
class Building < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { within: 7..50 },
            uniqueness: { case_sensitive: false }

  validates :map_link,
            presence: true,
            url: true

  # associations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :departments, as: :departmentable
  has_many :floors

  # active status
  enum status: %i[active disabled]

  # concerns
  include Imageable
end
