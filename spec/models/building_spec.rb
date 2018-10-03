require 'rails_helper'

RSpec.describe Building, type: :model do
  let(:building) { FactoryBot.create :building_image }
  let(:building_alt) { FactoryBot.create :building_no_image }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_least(4) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:map_link) }
    it { should define_enum_for(:status).with(%i[enabled disabled]) }
  end

  context 'associations' do
    it { should have_many(:addresses) }
    it { should have_many(:phones) }
    it { should have_many(:departments) }
    it { should have_many(:floors) }
  end

  context 'invalid options' do
    it 'expects name to be too long' do
      building.name = Faker::String.random(51)
      expect(building).to_not be_valid
      expect(building.errors.messages[:name]).to eq ['is too long (maximum is 50 characters)']
    end

    it 'expects name to be too short' do
      building.name = Faker::String.random(3)
      expect(building).to_not be_valid
      expect(building.errors.messages[:name]).to eq ['is too short (minimum is 4 characters)']
    end
  end

  context 'image uploader' do
    it_behaves_like "imageable"
  end

  describe 'elasticsearch' do
    before do
      building # instantiate building
      Building.import(force: true, refresh: true)
    end
    context 'determining indexes' do
      it 'should be indexed' do
        expect(Building.search(building.name).records.length).to eq(1)
      end
    end
  end

  describe 'conditional elasticsearch indexing' do
    before do
      building # instantiate
      Building.import(force: true, refresh: true)
    end
    context 'conditional indexes' do
      it 'a new record should be indexed' do
        new_building = FactoryBot.create :building
        Building.__elasticsearch__.refresh_index!
        expect(Building.search(new_building.name).records.length).to eq(1)
      end

      it 'should remove building after the update because of the status' do
        Building.__elasticsearch__.refresh_index!
        building.update(status: 'disabled')
        sleep 2 # let the callbacks work
        expect(Building.search(building.name).records.length).to eq 0
      end

      it 'should keep building in index after the update because of status' do
        Building.__elasticsearch__.refresh_index!
        building.update(status: 'enabled')
        sleep 2 # let the callbacks work
        expect(Building.search(building.name).records.length).to eq 1
      end

      it 'should delete the index after destroy' do
        # verify that the building exists before
        expect(Building.search(building.name).records.length).to eq 1
        building.destroy
        expect(Building.search(building.name).records.length).to eq 0
      end
    end
  end
end
