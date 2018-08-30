require 'rails_helper'

RSpec.describe Subject, type: :model do
  let(:subject) { FactoryBot.create :subject_association }

  context 'validations' do
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:employees) }
  end

  context 'valid object' do
    it 'expects subject to be valid' do
      expect(subject).to be_valid
    end
  end
end
