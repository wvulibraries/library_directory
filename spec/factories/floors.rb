FactoryBot.define do
  factory :floor do
    name { Faker::Lorem.characters(3..50) }
    association :building, factory: :building
 
    factory :floor_image do 
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_2.jpg'), 'image/jpeg') }
    end 
  end
end
