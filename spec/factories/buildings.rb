FactoryBot.define do
  factory :building do
    sequence(:name) { |n| "#{Faker::Simpsons.location} #{n}" }
    map_link { Faker::Internet.url }
    status { 'enabled' }

    factory :building_seed do
      map_link { Faker::Internet.url }
      status { 'enabled' }
      image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/test_#{rand(1..8)}.jpg"), 'image/jpeg') }
    end

    factory :building_seed_complete do
      map_link { Faker::Internet.url }
      status { 'enabled' }
      image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/test_#{rand(1..8)}.jpg"), 'image/jpeg') }
      after :create do |building|
        create_list :phone, 1, phoneable: building
        create_list :address, 1, addressable: building
      end
    end

    factory :building_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_1.jpg'), 'image/jpeg') }
    end

    factory :building_no_image do
      map_link { Faker::Internet.url }
      status { rand 0..1 }
      image { nil }
    end
  end
end
