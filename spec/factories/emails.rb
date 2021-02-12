FactoryBot.define do
  factory :email do
    address { "#{Faker::Internet.username}@mail.wvu.edu" }

    factory :email_department_association do
      association :emailable, factory: :department_building
    end    
  end
end
