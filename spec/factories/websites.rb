FactoryBot.define do
  factory :website do
    name_of_url { Faker::Lorem.characters(number: rand(10..30)) }
    url { Faker::Internet.url }

    factory :website_employee_association do
      association :webable, factory: :employee
    end
  end
end
