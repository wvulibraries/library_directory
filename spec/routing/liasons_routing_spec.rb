require 'rails_helper'

RSpec.describe LiaisonController, type: :routing do
  context '#get' do
    it 'routes to #list' do
      expect(get: '/liaisons').to route_to('liaison#list')
    end
  end
end
