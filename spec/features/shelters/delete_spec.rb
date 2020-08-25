# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter

require 'rails_helper'

RSpec.describe "As a visitor to the shelter show page" do
  it "I can delete a shelter" do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                             address: "1554 Diamond Lane",
                             city: "Destin",
                             state: "FL",
                             zip: "32540")
    visit "/shelters/#{shelter_1.id}"

    click_button "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter_1.name)
    expect(page).to_not have_button('Delete')
  end
end
