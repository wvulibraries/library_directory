require 'rails_helper'

RSpec.describe Building, type: :model do
  let(:building) { FactoryBot.create :building }

  context 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(7) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:map_link) }
    it { should define_enum_for(:status).with(%i[active disabled]) }
  end

  context 'invalid options' do
    it 'expects invalid from bad map url' do
      building.map_link = 'soemthing'
      expect(building).to_not be_valid
      expect(building.errors.messages[:map_link]).to eq ['is not a valid URL']
    end

    it 'expects name to be too long' do
      building.name = Faker::String.random(51)
      expect(building).to_not be_valid
      expect(building.errors.messages[:name]).to eq ['is too long (maximum is 50 characters)']
    end

    it 'expects name to be too short' do
      building.name = Faker::String.random(3)
      expect(building).to_not be_valid
      expect(building.errors.messages[:name]).to eq ['is too short (minimum is 7 characters)']
    end
  end

  # it 'expects building to have a valid map url' do
  #   expect(building).to be_valid
  # end
end
