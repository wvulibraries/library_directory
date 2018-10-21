require 'rails_helper'

RSpec.feature 'Admin::Departments', type: :feature do
  let(:department) { FactoryBot.create(:department_seed, building: building) }
  let(:new_department) { FactoryBot.attributes_for(:department_seed, building: building) }
  let(:building) { FactoryBot.create(:building) }

  before(:each) do
    building
    department
  end
 
  scenario 'department index page and it works properly' do
    visit '/admin/departments'
    expect(page).to have_content('Manage Departments')
  end

  scenario 'creates a new department' do
    visit '/admin/departments/new'
    building_name = find("#department_building_id > option:nth-child(2)").text
    select(building_name, from: 'Building')
    fill_in 'Name', with: new_department[:name]
    fill_in 'Description', with: new_department[:description]
    click_button 'Submit'
    expect(page).to have_content('Success! We built a brand new department!')
  end

  scenario 'errors no association' do
    visit '/admin/departments/new'
    fill_in 'Name', with: new_department[:name]
    fill_in 'Description', with: new_department[:description]
    click_button 'Submit'
    expect(page).to have_content('The following prohibited this department from being saved:')
    expect(page).to have_content('Building must exist')
  end

  scenario 'user clicks the cancel button goes back to the departments list' do
    visit '/admin/departments/new'
    click_link 'Cancel'
    expect(current_path).to  eq('/admin/departments')
    expect(page).to have_content('Manage Departments')
  end

  scenario 'updates an existing department' do
    visit "/admin/departments/#{department.id}/edit"
    fill_in 'Name', with: 'Changing the Name'
    click_button 'Submit'
    expect(page).to have_content('Success! We have edited the department!')
  end

  scenario 'errors on edit' do
    visit "/admin/departments/#{department.id}/edit"
    fill_in 'Name', with: 'tes' # must be 4 chars
    click_button 'Submit'
    expect(page).to have_content('The following prohibited this department from being saved:')
    expect(page).to have_content('Name is too short (minimum is 5 characters)')
  end

  scenario 'deletes an existing department' do
    visit '/admin/departments'
    click_link 'Destroy'
    expect(page).to have_content('Manage Departments')
    expect(page).to have_content('Demolition Success! We destroyed the department!')
    expect(page).to_not have_content(department.name)
  end
end
