require 'rails_helper'

RSpec.feature "Departments", type: :feature do
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

  scenario 'departments index page' do
    visit '/departments'
    expect(page).to have_content('Library Departments')
    expect(page).to have_content(department.name)
    expect(page).to have_content(department_two.name)
  end

  scenario 'department details' do
    phones = FactoryBot.create(:phone, phoneable: department)
    emails = FactoryBot.create(:email, emailable: department)
    service_point = FactoryBot.create(:service_point, department: department)
    # There is some really stupid stuff going on
    # phon numbers and service points aren't adding after create
    visit "/departments/#{department.id}"
    expect(page).to have_content(department.name)
    expect(page).to have_content(phones.number)
    expect(page).to have_content(emails.address)
    expect(page).to have_content(service_point.name)
  end

  scenario 'department employees' do
    visit "/departments/#{department.id}/employees"
    expect(page).to have_content(department.name)
    expect(page).to have_content(employee.display_name)
    expect(page).to have_content(employee.email)
  end
end
