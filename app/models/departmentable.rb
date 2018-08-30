class Departmentable < ApplicationRecord
  belongs_to :employee
  belongs_to :department
end