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
  belongs_to :building
  has_many :service_points, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy

  has_many :departmentable, dependent: :nullify
  has_many :employees, through: :departmentable

  # active status
  enum status: %i[enabled disabled]

  # form logic
  accepts_nested_attributes_for :service_points, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true

  # search
  include Searchable

  # return building name for search index
  def building_name
    building.name.to_s
  end

  # scopes
  scope :visible, -> { where(status: 'enabled') }
  scope :order_name, -> { order(:name) }

  # Elastic Search Settings
  #
  # @author David J. Davis
  #
  # @description
  # indexed json, this will help with search rankings.
  #
  # rake environment elasticsearch:import:model CLASS='Department' SCOPE="visible" FORCE=y
  def as_indexed_json(_options)
    as_json(
      methods: [:building_name],
      only: [:id, :name, :building_name],
      include: {
        service_points: { only: :name },
        phones: { only: :number }
      }
    )
  end
end
