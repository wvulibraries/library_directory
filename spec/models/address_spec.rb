require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryBot.create :address_building_association }

  context 'validations' do 
    it { should validate_length_of(:line1).is_at_most(50) }
    it { should validate_length_of(:line2).is_at_most(50) }
    it { should validate_length_of(:city).is_at_most(60) }
    it { should validate_length_of(:state).is_at_most(50) }
    it { should validate_length_of(:zip).is_at_most(20) }
  end

  context 'associations' do
    it { should belong_to(:addressable) }
  end 

  it 'expects address to be valid' do
    expect(address).to be_valid
  end
end
