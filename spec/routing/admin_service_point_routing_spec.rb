require 'rails_helper'

RSpec.describe Admin::ServicePointsController, type: :routing do
  context '#get' do
    it 'routes to #index' do
      expect(get: '/admin/service_points').to route_to('admin/service_points#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/service_points/new').to route_to('admin/service_points#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/service_points/1').to route_to('admin/service_points#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/service_points/1/edit').to route_to('admin/service_points#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/service_points').to route_to('admin/service_points#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/service_points/1').to route_to('admin/service_points#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/service_points/1').to route_to('admin/service_points#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/service_points/1').to route_to('admin/service_points#destroy', id: '1')
    end
  end
end
