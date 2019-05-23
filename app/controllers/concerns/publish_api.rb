# app/controllers/concerns/publish_api.rb
module PublishApi
  extend ActiveSupport::Concern
  # Setup a public cors header for the JSON GET Requests
  # This is for public API Only and used as a before filter.
  def public_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Allow-Headers'] = 'Origin, Authorization, Accept, Content-Type'
    headers['Content-Type'] = 'application/json'
  end
end
