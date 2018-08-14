class ServicePoint < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { within: 5..50 }

  # associations
  belongs_to :department
  has_many :phones, as: :phoneable, dependent: :destroy

  # form logic
  accepts_nested_attributes_for :phones, allow_destroy: true
end
