FactoryBot.define do
  factory :subject do
    name { Faker::String.random(3..49) }
    factory :subject_association do
      association :subjectable, factory: :employee
    end
  end
end
