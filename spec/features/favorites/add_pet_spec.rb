require 'rails_helper'

RSpec.describe "When a user adds pet to their favorites" do

  it "displays a message" do
      shelter = Shelter.create(name: 'Denver Dumb Friends League')
      pet_1 = shelter.pets.create(name: 'Eureka', approximate_age: 12, sex: 'F')
    "you now have now favorited #{pet_1.name}"
  end

  it "the message correctly increments for multiple pets" do
    shelter = Shelter.create(name: 'Denver Dumb Friends League')
    pet_1 = shelter.pets.create(name: 'Eureka', approximate_age: 12, sex: 'F')
    pet_2 = shelter.pets.create(name: "Tarqui", approximate_age: 2, sex: 'M')

    visit '/pets'

    within("#pet-#{pet_1.id}") do
      click_button "Add Song"
    end

    within("#pet-#{pet_2.id}") do
      click_button "Add Song"
    end

    within("#pet-#{pet_1.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("You now have 2 copies of #{pet_1.title} in your cart.")
  end
end
