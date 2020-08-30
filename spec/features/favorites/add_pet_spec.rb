require 'rails_helper'

RSpec.describe "When a user adds pet to their favorites" do

  it "displays a message" do
      shelter = Shelter.create(name: 'Denver Dumb Friends League')
      pet_1 = shelter.pets.create(name: 'Eureka', approximate_age: 12, sex: 'F')
    "you now have now favorited #{pet_1.name}"

    visit '/pets'

    within("#pet-#{pet_1.id}") do
      click_button "Add Pet To Favorites"
    end

    expect(page).to have_content("You now have #{pluralize(quantity, 'copy')} of #{pet.name} in your Favorites.")
  end

  it "the message correctly increments for multiple pets" do
    shelter = Shelter.create(name: 'Denver Dumb Friends League')
    pet_1 = shelter.pets.create(name: 'Eureka', approximate_age: 12, sex: 'F')
    pet_2 = shelter.pets.create(name: "Tarqui", approximate_age: 2, sex: 'M')

    visit '/pets'

    within("#pet-#{pet_1.id}") do
      click_button "Add Pet To Favorites"
    end

    within("#pet-#{pet_2.id}") do
      click_button "Add Pet To Favorites"
    end

    within("#pet-#{pet_1.id}") do
      click_button "Add Pet To Favorites"
    end

    expect(page).to have_content("You now have #{pluralize(quantity, 'copy')} of #{pet.name} in your Favorites.")

    expect(page).to have_content("Favorites: 3")
  end

  it "displays the total number of pets in the cart" do
    shelter = Shelter.create(name: 'Denver Dumb Friends League')
    pet_1 = shelter.pets.create(name: 'Eureka', approximate_age: 12, sex: 'F')
    pet_2 = shelter.pets.create(name: "Tarqui", approximate_age: 2, sex: 'M')

    visit "/pets"

    expect(page).to have_content("Favorites: 0")

    within("#pet-#{pet_1.id}") do
      click_button "Add Pet to Favorites"
    end

    expect(page).to have_content("Favorites: 1")

    within("#pet-#{pet_2.id}") do
      click_button "Add Pet to Favorites"
    end

    expect(page).to have_content("Favorites: 2")

    within("#pet-#{pet_1.id}") do
      click_button "Add Pet to Favorites"
    end

    expect(page).to have_content("Favorites: 3")
  end

end
