FactoryBot.define do
  factory :building do
    name { Faker::String.random(7..49) }
    map_link { Faker::Internet.url }
    status { rand 0..1 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_1.jpg'), 'image/jpeg') }
  end
end
