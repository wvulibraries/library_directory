FactoryBot.define do
  factory :floor do
    sequence(:name) { |n| "#{Faker::Lorem.characters(number: rand(3..30))} #{n}" }
    association :building, factory: :building
 
    factory :floor_image do 
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_2.jpg'), 'image/jpeg') }
    end 
  end
end
