require 'rails_helper'

RSpec.feature "Liasons", type: :feature do
  # vars for existing
  let(:subject) { FactoryBot.create(:subject) }
  let(:employee) { FactoryBot.create(:employee_seed, subjects: [subject]) }

  before(:each) do
    employee
  end

  scenario 'list the liasons' do
    visit '/liaisons'
    expect(page).to have_content('Subject')
    expect(page).to have_content('Librarian')
    expect(page).to have_content(employee.name)
    expect(page).to have_content(subject.name)
  end

  scenario 'redirects to the proper new link' do
    visit '/subjects'
    expect(current_path).to eq ('/liaisons')
  end 
end
