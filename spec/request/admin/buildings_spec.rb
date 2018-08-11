require 'rails_helper'

RSpec.describe 'Admin::Building Management', type: :request do
  it 'renders the proper layout' do
    get '/admin/buildings'
    # puts response.inspect
    expect(response).to have_http_status(200)
  end
end
