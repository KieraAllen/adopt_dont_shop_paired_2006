# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located

require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
    it "can see all shelters" do
      shelter_1 = Shelter.create(name: "The Dragon's Dream",
                                 address: "1554 Diamond Lane",
                                 city: "Destin",
                                 state: "FL",
                                 zip: "32540")
      shelter_2 = Shelter.create(name: "Bougie Beasts",
                                 address: "2244 Ruby Ave",
                                 city: "Cedar Rapids",
                                 state: "IA",
                                 zip: "52227")
      shelter_3 = Shelter.create(name: "Aurora's Animals",
                                 address: "1836 Emerald St.",
                                 city: "Phoenix",
                                 state: "AZ",
                                 zip: "85005")

      pet_1 = Pet.create(image: "TBD",
                         name: "Drax",
                         approximate_age: "102",
                         sex: "M",
                         shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "ETA",
                         name: "Charlie",
                         approximate_age: "80",
                         sex: "F",
                         shelter_id: shelter_2.id)
      pet_3 = Pet.create(image: "BYOB",
                         name: "Sparkles",
                         approximate_age: "7",
                         sex: "F",
                         shelter_id: shelter_3.id)

      visit "/pets"

      expect(page).to have_text(pet_1.image)
      expect(page).to have_text(pet_2.image)
      expect(page).to have_text(pet_3.image)
      expect(page).to have_text(pet_1.name)
      expect(page).to have_text(pet_2.name)
      expect(page).to have_text(pet_3.name)
      expect(page).to have_text(pet_1.approximate_age)
      expect(page).to have_text(pet_2.approximate_age)
      expect(page).to have_text(pet_3.approximate_age)
      expect(page).to have_text(pet_1.sex)
      expect(page).to have_text(pet_2.sex)
      expect(page).to have_text(pet_3.sex)
      expect(page).to have_text(shelter_1.name)
      expect(page).to have_text(shelter_2.name)
      expect(page).to have_text(shelter_3.name)
    end
  end
