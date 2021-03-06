FactoryBot.define do
  factory :employee do
    prefix { Faker::Name.prefix }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    suffix { Faker::Name.suffix }
    email { "#{Faker::Internet.username}@mail.wvu.edu" }
    wvu_username { Faker::Internet.username }
    status { 1 }
    role { rand(0..1) }
    university_classification { Faker::Job.field }
    job_title {  Faker::Job.title }
    description { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/test_2.jpg'), 'image/jpeg') }
    office_number { "#{Faker::Address.building_number} #{Faker::Address.community}"}

    factory :non_admin_cas do
      wvu_username { 'johntest' }
      role { 0 }
    end

    factory :admin_cas do
      wvu_username { 'johntest' }
      role { 1 }
    end

    factory :employee_seed do
      status { 'enabled' }
    end
  end
end
