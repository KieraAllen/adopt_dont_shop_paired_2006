require 'rails_helper'

RSpec.describe "When a user adds pet to their favorites" do

  it "displays a message" do
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

    visit "/pets/#{pet_1.id}"

    click_button "Add or Remove Pet from Favorites"

    expect(page).to have_content("#{pet_1.name} has been added to your Favorites!")
  end

  it "doesn't allow you to add pet to favorites twice" do
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

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content("Favorites: 0")

    click_button "Add or Remove Pet from Favorites"

    expect(page).to have_content("Favorites: 1")

    expect(page).to have_selector(:link_or_button, "Add or Remove Pet from Favorites")

  end











  # expect(page).to have_content("Remove Pet From Favorites")
  #
  # click_button "Remove Pet From Favorites"
  #
  # expect(page).to have_content("Favorites: 0")
  #
  # expect(page).to_not have_content("Remove Pet From Favorites")
  #
  # expect(page).to have_content("Add Pet to Favorites")

end
