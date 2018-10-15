FactoryBot.define do
  factory :department do
    name { Faker::Address.community }
    description { Faker::Lorem.paragraph }
    status { 'enabled' }
    
    factory :department_building do
      association :building, factory: :building_no_image
    end

    factory :department_seed do
      status 'enabled'
    end
  end
end
