require 'rails_helper'

RSpec.describe Phone, type: :model do
  let(:phone) { FactoryBot.create :phone_building_association }

  context 'validations' do 
    it { should validate_length_of(:number).is_at_least(10) }
    it { should validate_length_of(:number).is_at_most(30) }
    it { should validate_presence_of(:number) }
    it { should define_enum_for(:number_types).with_values(%i[phone home fax mobile]) }
  end

  context 'associations' do
    it { should belong_to(:phoneable) }
  end 

  context 'valid object' do 
    it 'expects address to be valid' do
      expect(phone).to be_valid
    end
  end
end
