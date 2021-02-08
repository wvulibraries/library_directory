# Building Active Record Object for storing the directories buildings
#
# @author Tracy A. McCormick
# @data_model
# @since 0.0.1
class Website < ApplicationRecord
  # associations
  belongs_to :webable, polymorphic: true

  # validations
  validates :url, presence: true, url: true
end