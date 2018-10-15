FactoryBot.define do
  factory :subject do
    name { Faker::Lorem.characters(3..49) }
  end
end
