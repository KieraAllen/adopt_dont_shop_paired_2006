
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
    click_link("Adopt Your Favorite Pets")
    expect(current_path).to eq("/adoption_apps/new")

    find(:css, "##{@pet_1.id}[value='Selected']").set(true)
  end

  it 'can select the pets at the top of the form' do
    expect(page).to have_content("Please select the pet(s) you'd like to apply for:")

    expect(page).to have_content(@pet_1.name)

    expect(page).to have_content("Select #{@pet_1.name}")
  end

  it "has fields for visitor to fill in their information" do
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

  # I see a flash message indicating my application went through for the pets that were selected
  it "sees a flash message indicating my application went through for the pets that were selected" do
    find(:css, "##{@pet_2.id}[value='Selected']").set(true)

    fill_in 'Name', with: "Balthezar"
    fill_in 'Address', with: '1554 Diamond Lane'
    fill_in 'City', with: 'Destin'
    fill_in 'State', with: 'FL'
    fill_in 'Zip', with: '32540'
    fill_in :phone_number, with: '8675309'
    fill_in 'Description', with: 'I am aight'
    fill_in :creep_status, with: 'Creep'

    click_on 'Submit Application'

    expect(page).to have_content("Your application for #{pet_1.name} has been submitted!")
  end

  # And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites
  it "removes favorited pets from favorites when application is submitted" do
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
end
