require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:dept) { FactoryBot.create :department }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(500) }
    it { should define_enum_for(:status).with(%i[enabled disabled]) }
  end

  context 'associations' do
    it { should belong_to(:building) }
    it { should have_many(:service_points) }
  end
end
