# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex

require 'rails_helper'

RSpec.describe "shelter pets index page", type: :feature do
    it "can only see pets from specific shelter" do
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

      pet_1 = Pet.create(image: "TBD",
                         name: "Drax",
                         approximate_age: "102",
                         sex: "M",
                         shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "ETA",
                         name: "Charlie",
                         approximate_age: "80",
                         sex: "F",
                         shelter_id: shelter_1.id)
      pet_3 = Pet.create(image: "BYOB",
                         name: "Sparkles",
                         approximate_age: "7",
                         sex: "F",
                         shelter_id: shelter_2.id)

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_text(pet_1.image)
      expect(page).to have_text(pet_2.image)
      expect(page).to_not have_text(pet_3.image)
      expect(page).to have_text(pet_1.name)
      expect(page).to have_text(pet_2.name)
      expect(page).to_not have_text(pet_3.name)
      expect(page).to have_text(pet_1.approximate_age)
      expect(page).to have_text(pet_2.approximate_age)
      expect(page).to_not have_text(pet_3.approximate_age)
      expect(page).to have_text(pet_1.sex)
      expect(page).to have_text(pet_2.sex)
      expect(page).to have_text(shelter_1.name)
      expect(page).to_not have_text(shelter_2.name)
    end
  end
