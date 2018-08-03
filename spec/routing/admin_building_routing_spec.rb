require 'rails_helper'

RSpec.describe Admin::BuildingsController, type: :routing do
  context '#get' do
    it 'routes to #index' do
      expect(get: '/admin/buildings').to route_to('admin/buildings#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/buildings/new').to route_to('admin/buildings#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/buildings/1').to route_to('admin/buildings#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/buildings/1/edit').to route_to('admin/buildings#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/buildings').to route_to('admin/buildings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/buildings/1').to route_to('admin/buildings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/buildings/1').to route_to('admin/buildings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/buildings/1').to route_to('admin/buildings#destroy', id: '1')
    end
  end
end
