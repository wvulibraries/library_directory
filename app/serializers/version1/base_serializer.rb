# Used to create serialized hashes which send formatted data to hashes
# for use in the API.  This will extend common functionality to each
# of the API builders.
#
# @author David J. Davis
# @since 0.0.1
module Version1
  # Base serializer used for common functionality.
  module BaseSerializer
    # Creates an array of hashes for phones used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_phones(phones)
      {
        phones: phones.map do |phone|
          {
            type: phone.number_types,
            number: phone.number
          }
        end
      }
    end

    # Creates an array of hashes for addresses used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_addresses(addresses)
      {
        address: addresses.map do |address|
        {
          human_readable: address.human_readable, 
          state: address.state, 
          city: address.city, 
          zip: address.zip, 
          line1: address.line1, 
          line2: address.line2
        }
       end
      }
    end

    # Creates an array of hashes for departments
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_base_departments(depts)
      {
        departments: depts.map do |dept|
        {
          name: dept.name, 
          description: dept.description
        }
       end
      }
    end

  end
end