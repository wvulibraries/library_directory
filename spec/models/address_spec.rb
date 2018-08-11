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

  describe '#human_readable' do
    it 'expects address to be human readable' do
      format = "#{address.line1} #{address.line2}, #{address.city}, #{address.state} #{address.zip}"
      expect(address.human_readable).to eq(format)
    end

    it 'expects a string value from the model' do
      expect(address.human_readable.class).to eq(String) 
    end
  end
end
