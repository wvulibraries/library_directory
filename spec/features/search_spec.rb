require 'rails_helper'

RSpec.feature "Search", type: :feature do
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

  scenario 'search with no results found' do
    visit '/search?query=sillylongstring'
    expect(page).to have_content('Search found 0 results for the keywords "sillylongstring"')
  end

  scenario 'search an employee name' do
    visit "/search?query=#{employee.name}"
    expect(page).to have_content(employee.name)
  end

  scenario 'search an department name' do
    visit "/search?query=#{department.name}"
    expect(page).to have_content(department.name)
  end

  scenario 'search an building name' do
    visit "/search?query=#{building.name}"
    expect(page).to have_content(building.name)
  end
end
