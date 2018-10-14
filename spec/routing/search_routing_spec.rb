require 'rails_helper'

RSpec.describe SearchController, type: :routing do
  context '#get' do
    it 'routes to #index' do
      expect(get: '/search?query=test').to route_to('search#index', query: 'test')
    end
  end
end
