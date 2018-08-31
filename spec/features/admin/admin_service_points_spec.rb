require 'rails_helper'

RSpec.feature 'Admin::Buildings', type: :feature do
  let(:service) { FactoryBot.create(:service_point) }
  let(:building) { FactoryBot.create(:building) }
  let(:new_service) { FactoryBot.attributes_for(:service_point) }
  let(:department) { FactoryBot.create(:department_building) }
  let(:phone) { FactoryBot.attributes_for(:phone) }


  before(:each) do
    building
    department
    service
  end

  scenario 'service index page and it works properly' do
    visit '/admin/service_points'
    expect(page).to have_content('Manage Service Points')
  end

  scenario 'creates a new service' do
    visit '/admin/service_points/new'
    select_option = find("#service_point_department_id > optgroup:nth-child(3) > option").text
    select(select_option, from: 'Department')
    fill_in 'Name', with: new_service[:name]
    click_button 'Submit'
    expect(page).to have_content('Success! We built a brand new service point!')
  end

  scenario 'errors on creating a new service' do
    visit '/admin/service_points/new'
    select_option = find("#service_point_department_id > optgroup:nth-child(3) > option").text
    select(select_option, from: 'Department')
    fill_in 'Name', with: 'tes' # must be 5 chars
    click_button 'Submit'
    expect(page).to have_content('1 Error')
    expect(page).to have_content('Name is too short (minimum is 5 characters)')
  end

  scenario 'updates an existing service' do
    visit "/admin/service_points/#{service.id}/edit"
    select_option = find("#service_point_department_id > optgroup:nth-child(3) > option").text
    select(select_option, from: 'Department')
    fill_in 'Name', with: 'Changing the Name'
    click_button 'Submit'
    expect(page).to have_content('Success! We have edited the service point!')
  end

  scenario 'errors on creating editing service' do
    visit "/admin/service_points/#{service.id}/edit"
    fill_in 'Name', with: 'tes' # must be 4 chars
    click_button 'Submit'
    expect(page).to have_content('1 Error')
    expect(page).to have_content('Name is too short (minimum is 5 characters)')
  end

  scenario 'deletes an existing building' do
    visit '/admin/service_points'
    click_link 'Destroy'
    expect(page).to have_content('Manage Service Points')
    expect(page).to have_content('Demolition Success! We destroyed the service point!')
    expect(page).to_not have_content(service.name)
  end

  scenario 'accepts nested attributes for phones', js: true do
    visit '/admin/service_points/new'
    select_option = find("#service_point_department_id > optgroup:nth-child(3) > option").text
    select(select_option, from: 'Department')
    fill_in 'Name', with: new_service[:name]
    click_link 'Add Phones'
    select('phone', from: 'Number types')
    fill_in 'Number', with: phone[:number]
    click_button 'Submit'
    expect(page).to have_content('Success! We built a brand new service point!')
  end
end
