require 'rails_helper'

RSpec.describe Subjectable, type: :model do
  context 'associations' do
    it { should belong_to(:subject) }
    it { should belong_to(:employee) }
  end 
end
