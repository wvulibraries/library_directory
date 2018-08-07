FactoryBot.define do
  factory :user do
    prefix { Faker::Name.prefix }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    suffix { Faker::Name.suffix }
    email { "#{Faker::Name.first_name}.#{Faker::Name.last_name}@mail.wvu.edu" }
    wvu_username { Faker::Internet.username(7..36) }
    status { rand(0..1) }
    role { rand(0..1) }
  end
end