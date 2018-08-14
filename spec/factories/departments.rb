FactoryBot.define do
  factory :department do
    name { Faker::String.random(7..49) }
    description { Faker::Lorem.paragraph }
    
    factory :department_building do
      association :building, factory: :building_no_image
    end
  end
end
