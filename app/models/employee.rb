# Employee
#
# @description: A sub class of the user model uses single table inheritance to
# determine type of profile and add extra details to user model
# @author David J. Davis, Tracy A. McCormick
# @data_model
# @since 0.0.1
class Employee < User
  # validations
  validates :job_title,
            length: { maximum: 70 },
            allow_blank: true

  validates :university_classification,
            presence: true,
            length: { within: 2..70 }

  validates :description, length: { maximum: 1500 }

  # associations
  has_many :departmentable, dependent: :nullify
  has_many :departments, through: :departmentable
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :websites, as: :webable, dependent: :destroy  
  has_many :subjectables, dependent: :nullify
  has_many :subjects, through: :subjectables

  # form logic
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :websites, allow_destroy: true

  # concerns
  include Imageable
  include Searchable

  # scopes
  scope :visible, -> { where(status: 'enabled') }
  scope :order_name, -> { order(:last_name, :first_name) }

  # Resume / CV Option
  mount_uploader :resume, ResumeUploader

  # resume?
  # -----------------------------------------------------
  # @author David J. Davis
  # @description looks to see if the user has a resume or cv attached
  # will return true if there is a file, false if no file
  # @return boolean
  def resume?
    !resume.file.nil?
  end

  # Elastic Search Settings
  # -----------------------------------------------------

  # Elastic Search Index settings.
  # These are set in the model to index only specific information.
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :display_name
      indexes :first_name
      indexes :last_name
      indexes :preferred_name
      indexes :job_title
      indexes :university_classification
      indexes :description
      indexes :status
      indexes :subjects do
        indexes :name 
      end      
      indexes :departments do
        indexes :name
      end      
      indexes :phones do
        indexes :number 
      end
      indexes :websites do
        indexes :name_of_url
        indexes :url 
      end      
    end
  end

  # @author David J. Davis
  # @description indexed json, this will help with search rankings.
  # rake environment elasticsearch:import:model CLASS='Employee' SCOPE="visible" FORCE=y
  def as_indexed_json(_options)
    # puts type    
    as_json(
      methods: [:display_name],
      only: %i[id status first_name last_name preferred_name display_name description job_title university_classification image],
      include: {
        departments: { methods: [:name, :building_name],
                       only: %i[name building_name] },
        subjects: { methods: [:name], only: [:name] },
        phones: { only: :number },
        websites: { only: :url }
      }
    )
  end
end
