require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { FactoryBot.create :employee }
  let(:employee_phone) { FactoryBot.create :employee_with_phone }
  let(:employee_address) { FactoryBot.create :employee_with_address }

  context 'validations' do
    # it { should validate_presence_of(:job_title) }
    it { should validate_length_of(:job_title).is_at_least(2) }
    it { should validate_length_of(:job_title).is_at_most(70) }

    it { should validate_presence_of(:university_classification) }
    it { should validate_length_of(:university_classification).is_at_least(2) }
    it { should validate_length_of(:university_classification).is_at_most(70) }

    it { should validate_length_of(:description).is_at_most(500) }
  end

  context 'associations' do
    it { should have_many(:addresses) }
    it { should have_many(:phones) }
    it { should have_many(:departments) }
    it { should have_many(:subjects) }
  end

  context 'image uploader' do
    it_behaves_like 'imageable'
  end

  context 'resume uploader' do
    it 'resume? should be true' do
      obj = FactoryBot.create(:employee, resume: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/resume_1.pdf'), 'image/pdf'))
      expect(obj.resume?).to eq true
      expect(obj.resume?).to be_in([true, false])
    end

    it 'resume? should be false' do
      obj = FactoryBot.create(:employee, resume: nil)
      expect(obj.resume?).to eq false
      expect(obj.resume?).to be_in([true, false])
    end

    it 'should not take any other formats' do
      obj = FactoryBot.build(:employee, resume: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_1.jpg'), 'image/jpeg'))
      expect(obj.valid?).to eq false
      expect(obj.errors[:resume].first).to eq('You are not allowed to upload "jpg" files, allowed types: pdf')
    end
  end

  describe 'elasticsearch' do
    before do
      employee # instantiate employee
    end
    context 'determining indexes' do
      it 'should be indexed' do
        name = employee.first_name
        Employee.import(force: true, refresh: true)
        expect(Employee.search(name).records.length).to eq(1)
      end
    end
  end

  describe 'conditional elasticsearch indexing using callbacks' do
    before do
      employee # instantiate
      Employee.import(force: true, refresh: true)
    end
    context 'conditional indexes' do
      it 'a new record should be indexed' do
        new_employee = FactoryBot.create :employee
        Employee.__elasticsearch__.refresh_index!
        expect(Employee.search(new_employee.first_name).records.length).to eq(1)
      end

      it 'should remove employee after the update because of the status' do
        new_employee = FactoryBot.create :employee
        Employee.__elasticsearch__.refresh_index!
        new_employee.update(status: 0)
        sleep 2
        expect(Employee.search(new_employee.first_name).records.length).to eq(0)
      end

      it 'should keep employee in index after the update because of status' do
        new_employee = FactoryBot.create :employee
        Employee.__elasticsearch__.refresh_index!
        new_employee.update(status: 'enabled')
        expect(Employee.search(new_employee.first_name).records.length).to eq(1)
      end

      it 'should delete the index after destroy' do
        # verify that the employee exists before
        expect(Employee.search(employee.first_name).records.length).to eq(1)
        employee.destroy
        expect(Employee.search(employee.first_name).records.length).to eq(0)
      end
    end
  end

end
