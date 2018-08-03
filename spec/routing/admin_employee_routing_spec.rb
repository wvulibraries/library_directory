require 'rails_helper'

RSpec.describe Admin::EmployeesController, type: :routing do
  context '#get' do
    it 'routes to #index' do
      expect(get: '/admin/employees').to route_to('admin/employees#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/employees/new').to route_to('admin/employees#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/employees/1').to route_to('admin/employees#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/employees/1/edit').to route_to('admin/employees#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/employees').to route_to('admin/employees#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/employees/1').to route_to('admin/employees#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/employees/1').to route_to('admin/employees#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/employees/1').to route_to('admin/employees#destroy', id: '1')
    end
  end
end
