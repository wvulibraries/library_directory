require 'rails_helper'

RSpec.describe ServicePoint, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

  context 'associations' do
    it { should belong_to(:department) }
    it { should have_many(:phones) }
  end
end
