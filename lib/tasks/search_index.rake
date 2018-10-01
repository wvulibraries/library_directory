require 'rake'
namespace :search_index do
  desc 'Re-index all environments'
  task all: :environment do
    Rake::Task['search_index:employee'].invoke
    Rake::Task['search_index:building'].invoke
    Rake::Task['search_index:department'].invoke
  end

  desc 'Properly Index Employees'
  task employee: :environment do
    puts "Indexing Employees"
    Employee.import force: true
    disabled = Employee.where(status: 'disabled')
    disabled.each { |e| e.__elasticsearch__.delete_document }
  end

  desc 'Properly Index Buildings'
  task building: :environment do
    puts "Indexing Buildings"
    Building.import force: true
    disabled = Building.where(status: 'disabled')
    disabled.each { |e| e.__elasticsearch__.delete_document }
  end

  desc 'Properly Index Departments'
  task department: :environment do
    puts "Indexing Departments"
    Department.import force: true
    disabled = Department.where(status: 'disabled')
    disabled.each { |e| e.__elasticsearch__.delete_document }
  end
end
