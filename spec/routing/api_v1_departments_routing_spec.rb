require 'rails_helper'

RSpec.describe Api::V1::DepartmentsController, type: :routing do
  context '#get' do
    it 'routes to #list' do
      expect(get: '/api/v1/departments').to route_to('api/v1/departments#list', format: :json)
    end

    it 'routes to #details' do
      expect(get: '/api/v1/departments/1').to route_to('api/v1/departments#details', format: :json, id: '1')
    end 

    it 'routes to #employees' do
      expect(get: '/api/v1/departments/1/employees').to route_to('api/v1/departments#employees', format: :json, id: '1')
    end
  end
end
