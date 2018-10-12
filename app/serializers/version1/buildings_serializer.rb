# Used to create serialized hashes which send formatted data to hashes
# for use in the API
#
# @author David J. Davis
# @since 0.0.1
module Version1
  # Specific Module is Building
  # V1 will be extended by Each Model that will need an API
  module BuildingsSerializer
    include Version1::BaseSerializer
    # Creates an array of Buildings used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_buildings(buildings)
      {
        buildings: buildings.map do |building|
          serialize_building(building)
        end
      }
    end

    # Creates an array of Buildings used in API Generation
    #
    # @author David J. Davis
    # @since 0.0.1
    def serialize_building(building)
      {
        id: building.id,
        name: building.name,
        directions: building.directions,
        image: "#{request.base_url}#{building.image.url}",
        maplink: building.map_link,
        phones: serialize_phones(building.phones),
        addresses: serialize_addresses(building.addresses),
        departments: serialize_base_departments(building.departments),
        floors: building.floors.pluck(:name)
      }
    end
  end
end