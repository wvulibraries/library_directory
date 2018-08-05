require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let(:un_auth) { nil }
  let(:admin) { FactoryBot.create :non_admin_cas }
  let(:non_admin) { FactoryBot.create :admin_cas }
  
  context 'non-authenticated user' do
    it 'should test the user does not have access to the page' do
      get :home
      expect(response.status).to eq(302)
    end

    it 'should redirect to the root page' do
      get :home
      expect(response).to redirect_to(root_path)
    end
  end

  # can't set session so can't test cas 
  # context 'authenticated user without admin access' do
  #   it 'should not allow user to access admin panel'
  #   it 'should redirect the user to the root page'
  #   it 'should provide feedback to the user why'
  # end

  # context 'authenticated user with admin access' do
  #   it 'should allow the user to access admin panel'
  # end
end