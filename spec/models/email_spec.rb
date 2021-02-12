require 'rails_helper'

RSpec.describe Email, type: :model do
  let(:email) { FactoryBot.create :email_department_association }

  context 'associations' do
    it { should belong_to(:emailable) }
  end 

  context 'custom validation .valid_email' do
    it 'expects a valid email response' do
      expect(email).to be_valid
    end

    it 'expects email to be invalid as anything, but .edu at the end' do
      email.address = Faker::Internet.email
      expect(email).to_not be_valid
      expect(email.errors.messages[:address]).to eq ['must be a valid WVU email.']
    end
  end  

end
