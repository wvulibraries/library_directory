require 'rails_helper'

RSpec.describe Building, type: :model do
  let(:building) { FactoryBot.create :building }

  it 'is valid with valid attributes' do
    expect(building).to be_valid
  end
end
