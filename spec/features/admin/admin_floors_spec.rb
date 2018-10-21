require 'rails_helper'

RSpec.feature 'Admin::Floors', type: :feature do
  let(:floor_create) { FactoryBot.create(:floor, building: building) }
  let(:new_floor) { FactoryBot.attributes_for(:floor, building: building) }
  let(:building) { FactoryBot.create(:building) }

  before(:each) do
    building
    floor_create
  end

  scenario 'floors index works properly' do
    visit '/admin/floors'
    expect(page).to have_content('Manage Floors')
  end

  scenario 'creates a new floor' do
    visit '/admin/floors/new'
    building_name = find("#floor_building_id > option:nth-child(2)").text
    select(building_name, from: 'Building')
    fill_in 'Name', with: new_floor[:name]
    attach_file('Floor Map', File.join(Rails.root, '/spec/support/files/test_8.jpg'))
    click_button 'Submit'
    expect(page).to have_content('Success! We built a brand new floor!')
  end

  scenario 'errors with no building' do
    visit '/admin/floors/new'
    fill_in 'Name', with: new_floor[:name]
    attach_file('Floor Map', File.join(Rails.root, '/spec/support/files/test_8.jpg'))
    click_button 'Submit'
    expect(page).to have_content('Building must exist')
  end

  scenario 'errors with no name' do
    visit '/admin/floors/new'
    building_name = find("#floor_building_id > option:nth-child(2)").text
    select(building_name, from: 'Building')
    fill_in 'Name', with: ''
    click_button 'Submit'
    expect(page).to have_content("Name can't be blank Name is too short (minimum is 3 characters)")
  end

  scenario 'user clicks the cancel button' do
    visit '/admin/floors/new'
    click_link 'Cancel'
    expect(current_path).to eq('/admin/floors')
    expect(page).to have_content('Manage Floors')
  end

  scenario 'updates an existing floor' do
    visit "/admin/floors/#{floor_create.id}/edit"
    fill_in 'Name', with: 'Changing the Name'
    click_button 'Submit'
    expect(page).to have_content('Success! We have edited the floor!')
  end

  scenario 'errors on edit floor with too short of a name' do
    visit "/admin/floors/#{floor_create.id}/edit"
    fill_in 'Name', with: 'te'
    click_button 'Submit'
    expect(page).to have_content('Name is too short (minimum is 3 characters)')
  end

  scenario 'deletes an existing floor' do
    visit '/admin/floors'
    click_link 'Destroy'
    expect(page).to have_content('Manage Floors')
    expect(page).to have_content('Demolition Success! We destroyed the floor!')
  end

end