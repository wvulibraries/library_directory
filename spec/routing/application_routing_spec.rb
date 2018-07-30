require 'rails_helper'

RSpec.describe ApplicationController, type: :routing do
  context 'Basic application routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('application#home')
      expect(get: '/home').to route_to('application#home')
    end
  end
end
