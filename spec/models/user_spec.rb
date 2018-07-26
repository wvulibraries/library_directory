require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(2) }
    it { should validate_length_of(:first_name).is_at_most(70) }

    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2) }
    it { should validate_length_of(:last_name).is_at_most(70) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:wvu_username) }
    it { should validate_length_of(:wvu_username).is_at_least(7) }
    it { should validate_length_of(:wvu_username).is_at_most(70) }
  end
  
  context 'custom validation .valid_email' do
    it 'expects a valid email response' do
      expect(user).to be_valid
    end 

    it 'expects email to be invalid as anything, but .edu at the end' do
      user.email = Faker::Internet.email
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to eq ['Email must be a valid WVU email.']
    end
  end

  context 'testing enums' do
    it { should define_enum_for(:status).with(%i[active disabled]) }
    it { should define_enum_for(:role).with(%i[basic admin]) }
  end

  context '.display_name' do
    it 'expects display name to be first middle last' do
      expect(user.display_name).to eq("#{user.first_name} #{user.middle_name} #{user.last_name}")
    end

    it 'expects display name to be a string' do
      expect(user.display_name.class).to eq(String)
    end

    it 'expects display name to be first last because middle does not exist' do
      user.middle_name = nil
      expect(user.display_name).to eq("#{user.first_name} #{user.last_name}")
    end

    it 'expects an empty string to also return first and last name only' do
      user.middle_name = ''
      expect(user.display_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
