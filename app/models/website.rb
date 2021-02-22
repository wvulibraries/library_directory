# Building Active Record Object for storing the employee websites
#
# @author Tracy A. McCormick
# @data_model
# @since 0.0.1
class Website < ApplicationRecord
  # validation
  validates :name_of_url, presence: true 
  validates :url, presence: true, url: true

  # associations
  belongs_to :webable, polymorphic: true
end