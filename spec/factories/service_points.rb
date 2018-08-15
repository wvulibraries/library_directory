FactoryBot.define do
  factory :service_point do
    name { "#{Faker::Lorem.characters(10)} Desk" }
    association :department, factory: :department_building
  end
end