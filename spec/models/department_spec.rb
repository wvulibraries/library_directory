require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:dept) { FactoryBot.create :department_building }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(500) }
    it { should define_enum_for(:status).with_values(%i[enabled disabled]) }
  end

  context 'associations' do
    it { should belong_to(:building) }
    it { should have_many(:service_points) }
  end

  describe 'elasticsearch' do
    context 'determining indexes' do
      it 'should be indexed' do
        dept # instantiate department
        Department.import(force: true, refresh: true)
        expect(Department.search(dept.name).records.length).to eq(1)
      end
    end
  end

  describe 'conditional elasticsearch indexing using callbacks' do
    before do
      dept # instantiate
      Department.import(force: true, refresh: true)
    end
    context 'conditional indexes' do
      it 'a new record should be indexed' do
        new_dept = FactoryBot.create :department_building
        puts new_dept.inspect
        Department.__elasticsearch__.refresh_index!
        expect(Department.search(new_dept.name).records.length).to eq(1)
      end

      it 'should not remove department after the update because of the status' do
        Department.__elasticsearch__.refresh_index!
        dept.update(status: 'disabled')
        sleep 2 # let the callbacks work
        expect(Department.search(dept.name).records.length).to eq 1
      end

      it 'should keep department in index after the update because of status' do
        Department.__elasticsearch__.refresh_index!
        dept.update(status: 'enabled')
        sleep 2 # let the callbacks work
        expect(Department.search(dept.name).records.length).to eq 1
      end

      it 'should delete the index after destroy' do
        # verify that the department exists before
        expect(Department.search(dept.name).records.length).to eq 1
        dept.destroy
        expect(Department.search(dept.name).records.length).to eq 0
      end
    end
  end

end
