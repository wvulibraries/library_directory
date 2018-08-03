require 'rails_helper'

RSpec.describe Admin::BuildingsController, type: :controller do
  context 'authentication' do
    describe 'authenticated user' do
      before { get 'admin/buildings', params: {}, session: { cas: { user:'test' }} }
      it 'expects an unauthorized access' do
        expect(response).to have_http_status(401)
        expect(response).to redirect_to('/admin/building')
        expect(response).to render_template('admin/building')
      end
    end
  end
end
