FactoryBot.define do
  factory :service_point do
    sequence(:name) { |n| "#{Faker::Lorem.characters(number: rand(10..30))} #{n}" }
    association :department, factory: :department_building

    after :create do |point|
      create_list :phone, 1, phoneable: point
    end
  end
end
