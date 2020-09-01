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

      visit "/pets/#{pet_1.id}"
      click_button "Add or Remove Pet from Favorites"
      
      visit "/favorites/"

      click_button "Remove From Favorites"

      expect(page).to have_content("#{pet_1.name} has been removed from your Favorites!")
    end
  end


end
