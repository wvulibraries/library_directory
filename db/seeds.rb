# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create my user as a custom seed user
my_user = {
  prefix: nil,
  first_name: 'David',
  middle_name: 'J', 
  last_name: 'Davis',
  suffix: 'MFA',
  email: 'djdavis@mail.wvu.edu',
  wvu_username: 'djdavis',
  status: 1,
  role: 1,
  university_classification: Faker::Job.field,
  job_title: Faker::Job.title,
  description: Faker::Lorem.paragraph,
  office_number: "#{Faker::Address.building_number} #{Faker::Address.community}"
}

Employee.create(my_user)

# create some buildings
3.times do
  FactoryBot.create :building_seed
end

# create some employees 
3.times do
  FactoryBot.create :employee
end

