require 'rails_helper'

RSpec.describe BuildingsController, type: :routing do
  context 'buildings controller, public #get requests' do
    it 'routes to #list' do
      expect(get: '/buildings').to route_to('buildings#list')
    end

    it 'routes to #details' do
      expect(get: '/buildings/1').to route_to('buildings#details', id: '1')
    end 

    it 'routes to #employees' do
      expect(get: 'buildings/1/employees').to route_to('buildings#employees', id: '1')
    end
  end
end
