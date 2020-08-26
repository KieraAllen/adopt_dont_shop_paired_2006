# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip

require 'rails_helper'

RSpec.describe 'shelters show page', type: :feature do
  it 'can see the shelter with that id including attributes' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_text(shelter_1.name)
    expect(page).to have_text(shelter_1.address)
    expect(page).to have_text(shelter_1.city)
    expect(page).to have_text(shelter_1.state)
    expect(page).to have_text(shelter_1.zip)
  end
end
