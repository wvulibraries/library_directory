require 'rails_helper'

RSpec.describe DepartmentController, type: :routing do
  context 'departments controller, public #get requests' do
    it 'routes to #list' do
      expect(get: '/departments').to route_to('department#list')
    end

    it 'routes to #details' do
      expect(get: '/departments/1').to route_to('department#details', id: '1')
    end 

    it 'routes to #employees' do
      expect(get: 'departments/1/employees').to route_to('department#employees', id: '1')
    end
  end
end
