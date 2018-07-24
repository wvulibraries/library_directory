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

  # active status
  enum status: %i[active disabled]

  # images
  mount_uploader :image, ImageUploader

  # provides a boolean
  # depends on carrierwave to mount an image uploader.
  #
  # @author David J. Davis
  # @since 0.0.1
  # @return [optional, [true, false]]
  def image?
    !image.file.nil?
  end
end
