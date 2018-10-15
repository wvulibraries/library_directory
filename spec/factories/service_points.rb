FactoryBot.define do
  factory :service_point do
    name { "#{Faker::Lorem.characters(20)} Desk" }
    association :department, factory: :department_building
  end
end
