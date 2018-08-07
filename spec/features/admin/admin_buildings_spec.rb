require 'rails_helper'

RSpec.feature 'Admin::Buildings', type: :feature do
  let(:building) { FactoryBot.create(:building) }
  let(:new_building) { FactoryBot.attributes_for(:building_seed) }

  scenario 'building index page and it works properly' do
    visit '/admin/buildings'
    expect(page).to have_content('Manage Buildings')
  end

  scenario 'creates a new building' do
    visit '/admin/buildings/new'
    fill_in 'Name', with: new_building[:name]
    fill_in 'Map link', with: new_building[:map_link]
    attach_file('Image', File.join(Rails.root, '/spec/support/files/test_8.jpg'))
    click_button 'Submit'
    expect(page).to have_content('Success! We built a brand new building!')
  end

  scenario 'errors on creating a new building' do
    visit '/admin/buildings/new'
    fill_in 'Name', with: 'test' # must be 7 chars
    fill_in 'Map link', with: 'google' # must be a link fail
    click_button 'Submit'
    expect(page).to have_content('2 Errors')
    expect(page).to have_content('Name is too short (minimum is 7 characters)')
    expect(page).to have_content('Map link is not a valid URL')
  end

  scenario 'updates an existing building' do
    visit "/admin/buildings/#{building.id}/edit"
    fill_in 'Name', with: 'Changing the Name'
    click_button 'Submit'
    expect(page).to have_content('Success! We have edited the building!')
  end

  scenario 'errors on creating editing building' do
    visit "/admin/buildings/#{building.id}/edit"
    fill_in 'Name', with: 'test' # must be 7 chars
    fill_in 'Map link', with: 'google' # must be a link fail
    click_button 'Submit'
    expect(page).to have_content('2 Errors')
    expect(page).to have_content('Name is too short (minimum is 7 characters)')
    expect(page).to have_content('Map link is not a valid URL')
  end

  scenario 'deletes an existing building' do
    building = FactoryBot.create(:building_seed)
    visit '/admin/buildings'
    click_link 'Destroy'
    expect(page).to have_content('Manage Buildings')
    expect(page).to have_content('Demolition Success! We destroyed the building!')
    expect(page).to_not have_content(building.name)
  end
end
