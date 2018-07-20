FactoryBot.define do
  factory :building do
    name { Faker::Simpsons.character }
    map_link { Faker::Internet.url }
    status { rand 0..1 }
  end
end
