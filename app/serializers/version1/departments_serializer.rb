# Used to create serialized hashes which send formatted data to hashes
# for use in the API
#
# @author David J. Davis
# @since 0.0.1
module Version1
  # Department Serializer
  module DepartmentsSerializer
    include Version1::BaseSerializer
    # Creates an array of Departments used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_departments(departments)
      {
        departments: departments.map do |department|
          serialize_department(department)
        end
      }
    end

    # Creates an array of Departments used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_department(department)
      {
        id: department.id,
        name: department.name,
        description: department.description,
        phones: serialize_phones(department.phones),
        service_points: serialize_service(department.service_points)
      }
    end

    # Creates an array of Departments used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_service(points)
      {
        service_point: points.map do |point|
          {
            name: point.name,
            phones: serialize_phones(point.phones),
          }
        end
      }
    end
  end
end