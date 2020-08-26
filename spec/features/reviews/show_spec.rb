# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status

require 'rails_helper'

RSpec.describe 'pets show page', type: :feature do
  it 'can see the pet with that id including attributes' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')
    pet_1 = Pet.create(image: 'TBD',
                       name: 'Drax',
                       description: 'Drax is a dragon.',
                       approximate_age: '102',
                       sex: 'M',
                       adoption_status: 'pending',
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_text(pet_1.image)
    expect(page).to have_text(pet_1.name)
    expect(page).to have_text(pet_1.description)
    expect(page).to have_text(pet_1.approximate_age)
    expect(page).to have_text(pet_1.sex)
    expect(page).to have_text(pet_1.adoption_status)
  end
end
