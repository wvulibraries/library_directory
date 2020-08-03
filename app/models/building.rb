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
  has_many :departments, -> { order(:name) }, dependent: :destroy
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
  scope :morgantown, -> { where(id: [9, 10, 11, 13, 12]) }
  scope :order_name, -> { order(:name) }

  # Elastic Search Settings
  # -----------------------------------------------------

  # Elastic Search Index settings.
  # These are set in the model to index only specific information.   
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name
      indexes :description
      indexes :status
    end
  end

  def type
    self.class
  end

  # Elasticsearch indexed json searches for boosting search relevancy. 
  # @author David J. Davis
  def as_indexed_json(_options)   
    as_json(
      only: [:id, :status, :name, :image],
      include: {
        departments: { only: :name },
        floors: { only: :number }
      }
    )
  end
end
