# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info

require 'rails_helper'

RSpec.describe 'New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit a shelter show page' do
      it 'can update a shelter' do
        shelter_1 = Shelter.create(name: "Dragon's Dream",
                                   address: '1554 Diamond Lane',
                                   city: 'Desitin',
                                   state: 'RL',
                                   zip: '32541')

        visit "/shelters/#{shelter_1.id}"

        click_link 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

        fill_in 'Name', with: "The Dragon's Dream"
        fill_in 'Address', with: '1664 Diamond Lane'
        fill_in 'City', with: 'Destin'
        fill_in 'State', with: 'FL'
        fill_in 'Zip', with: '32540'

        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter_1.id}")
        expect(page).to have_content("The Dragon's Dream")
        expect(page).to have_content('1664 Diamond Lane')
        expect(page).to have_content('Destin')
        expect(page).to have_content('FL')
        expect(page).to have_content('32540')
      end
    end
  end
end
