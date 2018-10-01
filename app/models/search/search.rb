class Search
  # set constant because it will make life easier
  MODELS_TO_SEARCH = [Employee, Building, Department]

  # initialize method 
  def initialize(query)
    @query = Sanitize.fragment(query)
  end

  # this will return the reuslts, most likely we are
  def results
    Elasticsearch::Model.search(query, MODELS_TO_SEARCH).results
  end

#   { "query": {
#     "bool": {
#       "should": [
#         {
#           "multi_match": {
#             "query": "SEARCH TERM HERE",
#             "fields": [
#               "title^70",
#               "description^30",
#               "content^20"
#             ],
#             "type": "phrase",
#             "boost": 100
#           }
#         },
#         {
#           "multi_match": {
#             "query": "SEARCH TERM HERE",
#             "fields": [
#               "title^30",
#               "description^25",
#               "content^10"
#             ],
#             "type": "most_fields",
#             "minimum_should_match": "100%",
#             "boost": 50
#           }
#         },
#         {
#           "multi_match": {
#             "query": "SEARCH TERM HERE",
#             "fields": [
#               "title^25",
#               "description^15",
#               "content^10"
#             ],
#             "type": "most_fields",
#             "minimum_should_match": "50%",
#             "boost": 25
#           }
#         }
#       ]
#     }
#   }
# }

  def better_query(query)
    {
      query: {
        bool: { 
          should: [
            {
              multi_match: {
                query: @search_term,
                fields: [
                          'name^25',
                          'first_name^25',
                          'last_name^25',
                          'preferred_name^10',
                          'description^10',
                          'departments^5',
                          'subjects^15'
                        ],
                type: "phrase",
                boost: 100,
                fuzziness: 1
              }
            }, {
              multi_match: {
                query: @search_term,
                fields: [
                          'name^25',
                          'first_name^25',
                          'last_name^25',
                          'preferred_name^10',
                          'description^10',
                          'departments^5',
                          'subjects^15'
                        ],
                minimum_should_match: '100%',
                type: 'most_fields',
                boost: 50,
                fuzziness: 1
              }
            }, {
              multi_match: {
                query: @search_term,
                fields: [
                          'name^25',
                          'first_name^25',
                          'last_name^25',
                          'preferred_name^10',
                          'description^10',
                          'departments^5',
                          'subjects^15'
                        ],
                minimum_should_match: '50%',
                type: 'most_fields',
                boost: 25,
                fuzziness: 1
              }
            }
          ]
        }
      }
    }
  end

end
