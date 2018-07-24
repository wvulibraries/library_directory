FactoryBot.define do
  factory :phone do
    number_types { rand(0..3) }
    number { Faker::PhoneNumber.phone_number }

    factory :phone_building_association do
      association :phoneable, factory: :building_no_image
    end
  end
end
