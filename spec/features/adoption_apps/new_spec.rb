
require 'rails_helper'

RSpec.describe 'when a user wants to apply to adopt a pet' do
    before :each do
      @shelter_1 = Shelter.create(name: "The Dragon's Dream",
                                 address: '1554 Diamond Lane',
                                 city: 'Destin',
                                 state: 'FL',
                                 zip: '32540')
      @pet_1 = Pet.create(image: 'TBD',
                          name: 'Drax',
                          approximate_age: '102',
                          sex: 'M',
                          shelter_id: @shelter_1.id)
      @pet_2 = Pet.create(image: 'ETA',
                         name: 'Charlie',
                         approximate_age: '80',
                         sex: 'F',
                         shelter_id: @shelter_1.id)

      visit "/pets/#{@pet_1.id}"
      click_button "Add or Remove Pet from Favorites"
      visit "/pets/#{@pet_2.id}"
      click_button "Add or Remove Pet from Favorites"

      visit '/favorites'

      #THE CODE THAT SELECTS THE FIRST PET AS A FAVORITE GOES HERE
    end

  it 'visits favorites page and goes to new app form' do
    expect(page).to have_link("Adopt Your Favorite Pets")

    click_link("Adopt Your Favorite Pets")

    expect(current_path).to eq("/adoption_apps/new")
  end

  it "has fields for visitor to fill in their information" do
    click_link("Adopt Your Favorite Pets")

    fill_in 'Name', with: "Balthezar"
    fill_in 'Address', with: '1554 Diamond Lane'
    fill_in 'City', with: 'Destin'
    fill_in 'State', with: 'FL'
    fill_in 'Zip', with: '32540'
    fill_in :phone_number, with: '8675309'
    fill_in 'Description', with: 'I am aight'
    fill_in :creep_status, with: 'Creep'

    click_on 'Submit Application'
    expect(current_path).to eq('/favorites')
  end

  it "removes favorited pets from favorites when application is submitted" do
    click_link("Adopt Your Favorite Pets")

    fill_in 'Name', with: "Balthezar"
    fill_in 'Address', with: '1554 Diamond Lane'
    fill_in 'City', with: 'Destin'
    fill_in 'State', with: 'FL'
    fill_in 'Zip', with: '32540'
    fill_in :phone_number, with: '8675309'
    fill_in 'Description', with: 'I am aight'
    fill_in :creep_status, with: 'Creep'

    click_on 'Submit Application'
    expect(current_path).to eq('/favorites')

    expect(page).to_not have_content('Drax')
  end


  it 'can select the pets at the top of the form' do
    click_link("Adopt Your Favorite Pets")

    expect(page).to have_content("Please select the pet(s) you'd like to apply for:")

    expect(page).to have_content(@pet_1.name) || have_content("You have no favorited pets!")

    #We're going to expect it to have a link to this pet and that pet, but not this unfavorited BAD pet.  This Pet is up for DESTRUCTION
  end

end

# At the top of the form, I can select from the pets of which I've favorited for which I'd like this application to apply towards (can be more than one)

# I see a flash message indicating my application went through for the pets that were selected

# And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites
