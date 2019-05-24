# Used to create serialized hashes which send formatted data to hashes
# for use in the API
#
# @author David J. Davis
# @since 0.0.1
module Version1
  # Specific Module is Building
  # V1 will be extended by Each Model that will need an API
  module EmployeesSerializer
    include Version1::BaseSerializer
    # Creates an array of Buildings used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_employees(employees)
      {
        employees: employees.map do |employee|
          serialize_employee(employee)
        end
      }
    end

    # Creates an array of Buildings used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_employee(employee)
      {
        id: employee.id,
        display_name: employee.display_name.strip,
        name: employee.name,
        first_name: employee.first_name,
        last_name: employee.last_name,
        middle_name: employee.middle_name,
        job_title: employee.job_title,
        university_classification: employee.university_classification,
        email: employee.email,
        image: "#{request.base_url}#{employee.image.url}",
        phones: serialize_phones(employee.phones),
        addresses: serialize_addresses(employee.addresses),
        departments: serialize_departmentable(employee.departmentable),
        subjects: employee.subjects.pluck(:name),
        cv: ("#{request.base_url}#{employee.resume.url}" if employee.resume?)
      }
    end

    # Creates an array of department and role
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_departmentable(departmentable)
      {
        department: departmentable.map do |d|
          {
            name: d.department.name,
            building: d.department.building_name,
            role: d.leadership_role
          }
        end
      }
    end
  end
end
