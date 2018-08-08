require 'rails_helper'

RSpec.feature 'Admins', type: :feature do
  # skipping all authentication testing because
  # features and request tests can't get sessions
  # it 'should let you get to the admin page' do
  #   visit '/admin'
  #   expect(page).to have_text('Yay! This is the admin home page.')
  # end
end
