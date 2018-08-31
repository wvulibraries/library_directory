FactoryBot.define do
  factory :subject do
    name { Faker::String.random(3..49) }
  end
end
