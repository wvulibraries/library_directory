require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  context 'authentication' do
    context 'unauthenticated user' do
      it 'should redirect un' do
        get '/admin'
        expect(response).to have_http_status(401)
      end 
    end 

    context 'authenticated user' do
      before { get '/admin', params: {}, session: { cas: { user:'test' }} }
      it 'expects a user to have access' do
        expect(response).to have_http_status(401)
        expect(response).to redirect_to('/admin')
        expect(response).to render_template('admin/home')
      end
    end
  end
end