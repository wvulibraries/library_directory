require 'rails_helper'

RSpec.describe Admin::FloorsController, type: :routing do
  context '#get' do
    it 'routes to #index' do
      expect(get: '/admin/floors').to route_to('admin/floors#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/floors/new').to route_to('admin/floors#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/floors/1').to route_to('admin/floors#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/floors/1/edit').to route_to('admin/floors#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/floors').to route_to('admin/floors#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/floors/1').to route_to('admin/floors#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/floors/1').to route_to('admin/floors#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/floors/1').to route_to('admin/floors#destroy', id: '1')
    end
  end
end
