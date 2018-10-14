require 'rails_helper'

RSpec.describe Api::V1::BuildingsController, type: :routing do
  context '#get' do
    it 'routes to #list' do
      expect(get: '/api/v1/buildings').to route_to('api/v1/buildings#list', format: :json)
    end

    it 'routes to #details' do
      expect(get: '/api/v1/buildings/1').to route_to('api/v1/buildings#details', format: :json, id: '1')
    end 

    it 'routes to #employees' do
      expect(get: '/api/v1/buildings/1/employees').to route_to('api/v1/buildings#employees', format: :json, id: '1')
    end
  end
end
