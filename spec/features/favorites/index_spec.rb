# User Story 14, No Favorites Page
#
# As a visitor
# When I have not added any pets to my favorites list
# And I visit my favorites page ("/favorites")
# I see text saying that I have no favorited pets

require 'rails_helper'

RSpec.describe "When a user visits favorites index" do

  it "shows no pets when no pets have been added" do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')
    pet_1 = Pet.create(image: 'TBD',
                        name: 'Drax',
                        approximate_age: '102',
                        sex: 'M',
                        shelter_id: shelter_1.id)

    visit "/favorites"


    expect(page).to_not have_content(pet_1.name)

    expect(page).to have_content("You have no favorited pets!")

  end


end
