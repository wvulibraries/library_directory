class Departmentable < ApplicationRecord
  # associations
  belongs_to :employee
  belongs_to :department

  # enum
  enum leadership_role: %i[ member
                            director
                            assistant_director
                            head
                            manager
                            interim_director
                            dean
                            interim_dean ]
end
