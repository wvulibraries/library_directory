FactoryBot.define do
  factory :building do
    name { Faker::String.random(7..49) }
    map_link { Faker::Internet.url }
    status { rand 0..1 }
    
    factory :building_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_1.jpg'), 'image/jpeg') }
    end
  
    factory :building_no_image do
      image { nil }
    end
  end
end
