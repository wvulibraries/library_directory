FactoryBot.define do
  factory :building do
    name { Faker::Lorem.characters(7..49) }
    map_link { Faker::Internet.url }
    status { rand 0..1 }

    factory :building_seed do
      name { Faker::Simpsons.location }
      map_link { Faker::Internet.url }
      status { rand 0..1 }
      image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/test_#{rand(1..8)}.jpg"), 'image/jpeg') }
    end

    factory :building_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_1.jpg'), 'image/jpeg') }
    end

    factory :building_no_image do
      name { Faker::Simpsons.location }
      map_link { Faker::Internet.url }
      status { rand 0..1 }
      image { nil }
    end
  end
end
