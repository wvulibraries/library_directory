require 'rails_helper'

RSpec.describe Floor, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

  context 'associations' do
    it { should belong_to(:building) }
  end

  context 'images' do
    it_behaves_like "imageable"
  end
end
