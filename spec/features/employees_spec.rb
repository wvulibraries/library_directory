require 'rails_helper'

RSpec.feature "Employees", type: :feature do
  # vars for existing
  let(:building) { FactoryBot.create(:building_seed) }
  let(:building_complete) { FactoryBot.create(:building_seed_complete, name: 'Jumping Joes Crab Shack') }
  let(:department) { FactoryBot.create(:department_seed, building: building) }
  let(:department_two) { FactoryBot.create(:department_seed, building: building) }
  let(:employee) { FactoryBot.create(:employee_seed, departments: [department, department_two]) }

  before(:each) do
    # instantiate creations so that each page can see them 
    building
    department
    department_two
    employee
  end

  scenario 'employee list index' do
    visit '/employees'
    expect(page).to have_content(employee.display_name)
    expect(page).to have_content(department.name)
  end

  scenario 'employee profile' do
    visit "/employee/#{employee.id}"
    expect(page).to have_content(employee.display_name)
    expect(page).to have_content(employee.job_title)
    expect(page).to have_content(employee.university_classification)
    expect(page).to have_content(employee.email)
    expect(page).to have_content(department.name)
  end
end
