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
  has_many :service_points, -> { order(:name) }, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy

  has_many :departmentable, dependent: :nullify
  has_many :employees, -> { order(:last_name, :first_name) }, through: :departmentable

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

  def type
    self.class
  end

  # scopes
  scope :visible, -> { where(status: 'enabled') }
  scope :order_name, -> { order(:name) }

  # Elastic Search Settings
  # -----------------------------------------------------

  # Elastic Search Index settings.
  # These are set in the model to index only specific information.   
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :type
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
    puts type    
    as_json(
      methods: [:building_name, :type],
      only: [:id, :type, :status, :name, :building_name],
      include: {
        service_points: { only: :name },
        phones: { only: :number }
      }
    )
  end
end
