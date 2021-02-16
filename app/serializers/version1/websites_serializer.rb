# Used to create serialized hashes which send formatted data to hashes
# for use in the API
#
# @author Tracy A. McCormick
# @since 0.0.1
module Version1
  # Website Serializer
  module WebsitesSerializer
    include Version1::BaseSerializer
    # Creates an array of hashes for websites used in API Generation
    #
    # @author Tracy A. McCormick
    # @since 0.0.1
    def serialize_websites(websites)
      websites.map do |website|
        {
          name_of_url: website.name_of_url,
          url: website.url
        }
      end
    end
  end
end
