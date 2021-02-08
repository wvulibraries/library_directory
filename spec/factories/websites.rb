FactoryBot.define do
  factory :website do
    url { Faker::Internet.url }

    factory :website_employee_association do
      association :webable, factory: :employee
    end
  end
end
