require 'rails_helper'

RSpec.describe "When a user wants to remove a pet from their favorites" do

  describe "on the pet show page" do
    it "clicks the add or remove button to remove pet" do
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
      click_button "Add or Remove Pet from Favorites"

      expect(page).to have_content("#{pet_1.name} has been removed from your Favorites!")
    end
  end
  #


  # User Story 13, Remove a Favorite from Favorites Page
  #
  # As a visitor
  # When I have added pets to my favorites list
  # And I visit my favorites page ("/favorites")
  # Next to each pet, I see a button or link to remove that pet from my favorites
  # When I click on that button or link to remove a favorite
  # A delete request is sent to "/favorites/:pet_id"
  # And I'm redirected back to the favorites page where I no longer see that pet listed
  # And I also see that the favorites indicator has decremented by 1


  describe "on the favorites index" do
    it "clicks the remove pet button" do
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
      pet_2 = Pet.create(image: 'ETA',
                         name: 'Charlie',
                         approximate_age: '80',
                         sex: 'F',
                         shelter_id: shelter_1.id)

      visit "/pets/#{pet_1.id}"
      click_button "Add or Remove Pet from Favorites"
      visit "/pets/#{pet_2.id}"
      click_button "Add or Remove Pet from Favorites"

      visit "/favorites/"

      # click_button "Remove From Favorites"

      first('.button').click_button("Remove From Favorites")

      expect(page).to have_content("#{pet_1.name} has been removed from your Favorites!")
    end
  end


end
