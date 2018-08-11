FactoryBot.define do
  factory :address do
    line1 { Faker::Address.street_address }
    line2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.city }

    factory :address_building_association do
      association :addressable, factory: :building_no_image
    end

    factory :building_seed_association do
      association :addressable, factory: :building_seed
    end
  end
end
