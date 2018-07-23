# building model
class Building < ApplicationRecord
  # validation
  validates :name, presence: true, length: { within: 7..50 }, uniqueness: true
  validates :map_link, presence: true, url: true

  # active status
  enum status: %i[active disabled]

  # images
  mount_uploader :image, ImageUploader
end
