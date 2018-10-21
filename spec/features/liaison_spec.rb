require 'rails_helper'

RSpec.feature "Liasons", type: :feature do
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

  scenario 'building index page' do
    visit '/buildings'
    expect(page).to have_content('Library Buildings')
    expect(page).to have_content(building.name)
  end

  scenario 'building on index page with an address and phone number' do
    building_complete #instantiate 
    visit '/buildings'
    expect(page).to have_content('Library Buildings')
    expect(page).to have_content(building_complete.name)
    expect(page).to have_content(building_complete.addresses.first.human_readable)
    expect(page).to have_content(building_complete.phones.first.number)
  end

  scenario 'building details' do
    visit "/buildings/#{building.id}"
    expect(page).to have_content(building.name)
  end

  scenario 'building employees' do
    visit "/buildings/#{building.id}/employees"
    expect(page).to have_content(employee.display_name)
  end

  scenario 'building employees shows the departments' do
    visit "/buildings/#{building.id}/employees"
    expect(page).to have_content(employee.departments.first.name)
    expect(page).to have_content(employee.departments.last.name)
    expect(page).to have_content(employee.email)
  end
end
