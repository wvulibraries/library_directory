require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { FactoryBot.create :employee }
  let(:employee_phone) { FactoryBot.create :employee_with_phone }
  let(:employee_address) { FactoryBot.create :employee_with_address }

  context 'validations' do
    it { should validate_presence_of(:job_title) }
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
  end

  context 'image uploader' do
    it_behaves_like 'imageable'
  end
end
