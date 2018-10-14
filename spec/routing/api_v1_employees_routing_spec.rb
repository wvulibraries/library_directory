require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :routing do
  context '#get' do
    it 'routes to #list' do
      expect(get: '/api/v1/employees').to route_to('api/v1/employees#list', format: :json)
    end

    it 'routes to #profile' do
      expect(get: '/api/v1/employees/1').to route_to('api/v1/employees#profile', format: :json, id: '1')
    end
  end
end
