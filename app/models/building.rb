# Building Active Record Object for storing the directories buildings
#
# @author David J. Davis
# @data_model
# @since 0.0.1
class Building < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { within: 4..50 },
            uniqueness: { case_sensitive: false }

  validates :map_link,
            presence: true

  # associations
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :departments, dependent: :destroy
  has_many :floors, dependent: :destroy

  # form logic
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :departments, allow_destroy: true
  accepts_nested_attributes_for :floors, allow_destroy: true

  # active status
  enum status: %i[enabled disabled]

  # concerns
  include Imageable
  include Searchable

  # scopes
  scope :visible, -> { where(status: 'enabled') }

  # Elastic Search Settings
  #
  # @author David J. Davis
  #
  # @description
  # indexed json, this will help with search rankings.
  #
  # rake environment elasticsearch:import:model CLASS='Building' SCOPE="visible" FORCE=y
  def as_indexed_json(_options)
    as_json(
      only: [:id, :name, :image],
      include: {
        departments: { only: :name },
        floors: { only: :number }
      }
    )
  end
end
