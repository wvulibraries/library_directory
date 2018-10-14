require 'rails_helper'

RSpec.describe EmployeesController, type: :routing do
  context '#get' do
    it 'routes to #list' do
      expect(get: '/employees').to route_to('employees#list')
    end

    it 'routes to #profile' do
      expect(get: '/employee/1').to route_to('employees#profile', id: '1')
    end
  end
end
