require 'rails_helper'

RSpec.feature "Admin::Employees", type: :feature do
  # vars for existing 
  let(:building) { FactoryBot.create(:building) }
  let(:department) { FactoryBot.create(:department_seed, building: building) }
  let(:employee_existing) { FactoryBot.create(:employee) }
  # vars for creating 
  let(:address) { FactoryBot.attributes_for(:address) }
  let(:phone) { FactoryBot.attributes_for(:phone) }
  let(:employee) { FactoryBot.attributes_for(:employee) }

  before(:each) do
    building
    department
    employee_existing
  end

  scenario 'testing the index page for employees and returning proper information' do
    visit '/admin/employees'
    expect(page).to have_content('Manage Employees')
  end 

  scenario 'creates a new employee' do
    visit '/admin/employees/new'
    select('Mr', from: 'Prefix')
    fill_in 'First name', with: employee[:first_name]
    fill_in 'Middle name', with: employee[:middle_name]
    fill_in 'Last name', with: employee[:last_name]
    select('I', from: 'Suffix')
    fill_in 'Wvu username', with: employee[:wvu_username]
    fill_in 'Email', with: employee[:email]
    fill_in 'Job title', with: employee[:job_title]
    fill_in 'University classification', with: employee[:university_classification]
    fill_in 'Description', with: employee[:description]
    select('basic', from: 'User Role')
    select('enabled', from: 'User Status')
    click_button 'Submit'
    expect(page).to have_content('Success! Employee profile was created!')
  end

  scenario 'fails creating a new employee because of no wvu username' do
    visit '/admin/employees/new'
    select('Mr', from: 'Prefix')
    fill_in 'First name', with: employee[:first_name]
    fill_in 'Middle name', with: employee[:middle_name]
    fill_in 'Last name', with: employee[:last_name]
    select('I', from: 'Suffix')
    fill_in 'Wvu username', with: ''
    fill_in 'Email', with: employee[:email]
    fill_in 'Job title', with: 'employee[:job_title]'
    fill_in 'University classification', with: employee[:university_classification]
    fill_in 'Description', with: employee[:description]
    select('basic', from: 'User Role')
    select('enabled', from: 'User Status')
    click_button 'Submit'
    expect(page).to have_content('Wvu username can\'t be blank')
    expect(page).to have_content('Wvu username is too short (minimum is 4 characters)')
  end

  scenario 'updates an existing employee' do
    visit "/admin/employees/#{employee_existing.id}/edit"
    fill_in 'First name', with: 'Gimli'
    click_button 'Submit'
    expect(page).to have_content('Success! Employee profile was edited.')
  end

  scenario 'fails updating an existing employee' do
    visit "/admin/employees/#{employee_existing.id}/edit"
    fill_in 'First name', with: 'G'
    click_button 'Submit'
    expect(page).to have_content('First name is too short (minimum is 2 characters)')
  end

  scenario 'deletes an existing employee' do
    # then visit destroy path
    visit '/admin/employees'
    click_link 'Delete'
    expect(page).to have_content('Manage Employees')
    expect(page).to have_content('Employee Removed! The employee profile was removed, for temporary removal you should change the employee status.')
    expect(page).to_not have_content(employee_existing.first_name)
  end

  scenario 'accepts nested attributes for address', js: true do
    visit '/admin/employees/new'
    select('Mr', from: 'Prefix')
    fill_in 'First name', with: employee[:first_name]
    fill_in 'Middle name', with: employee[:middle_name]
    fill_in 'Last name', with: employee[:last_name]
    select('I', from: 'Suffix')
    fill_in 'Wvu username', with: employee[:wvu_username]
    fill_in 'Email', with: employee[:email]
    fill_in 'Job title', with: employee[:job_title]
    fill_in 'University classification', with: employee[:university_classification]
    fill_in 'Description', with: employee[:description]
    select('basic', from: 'User Role')
    select('enabled', from: 'User Status')
    click_link 'Add Address'
    fill_in 'Street Address', with: address[:line_1]
    fill_in 'City', with: address[:city]
    select('OH', from: 'State')
    fill_in 'Zip', with: address[:zip]
    click_button 'Submit'
    expect(page).to have_content('Success! Employee profile was created!')
  end

  scenario 'accepts nested attributes for phones', js: true do
    visit '/admin/employees/new'
    select('Mr', from: 'Prefix')
    fill_in 'First name', with: employee[:first_name]
    fill_in 'Middle name', with: employee[:middle_name]
    fill_in 'Last name', with: employee[:last_name]
    select('I', from: 'Suffix')
    fill_in 'Wvu username', with: employee[:wvu_username]
    fill_in 'Email', with: employee[:email]
    fill_in 'Job title', with: employee[:job_title]
    fill_in 'University classification', with: employee[:university_classification]
    fill_in 'Description', with: employee[:description]
    select('basic', from: 'User Role')
    select('enabled', from: 'User Status')
    click_link 'Add Phones'
    select('phone', from: 'Number types')
    fill_in 'Number', with: phone[:number]
    click_button 'Submit'
    expect(page).to have_content('Success! Employee profile was created!')
  end
end
