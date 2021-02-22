FactoryBot.define do
  factory :department do
    sequence(:name) { |n| "#{Faker::Lorem.characters(number: rand(10..30))} #{n}" }
    description { Faker::Lorem.paragraph }
    status { 'enabled' }

    factory :department_building do
      association :building, factory: :building_no_image
    end

    factory :department_seed do
      status { 'enabled' }
      after :create do |department|
        create_list :phone, 1, phoneable: department
        create_list :email, 1, emailable: department
        create_list :service_point, 1, department: department
      end
    end
  end
end
