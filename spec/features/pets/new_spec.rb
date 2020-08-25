# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed

require 'rails_helper'

RSpec.describe "creating a new pet" do
  it "can create a pet" do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: "1554 Diamond Lane",
                               city: "Destin",
                               state: "FL",
                               zip: "32540")

    visit "/shelters/#{shelter_1.id}/pets"

    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in "Image", with: "TBD"
    fill_in "Name", with: "Drax"
    fill_in "Description", with: "Drax is a Dragon."
    fill_in :approximate_age, with: "102"
    fill_in "Sex", with: "M"

    click_on 'Create Pet'

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("TBD")
    expect(page).to have_content("Drax")
    expect(page).to have_content(new_pet.name)
    expect(page).to have_content("102")
  end
end
