require 'rails_helper'

RSpec.describe 'create new review from shelter show page' do
  it 'can create a review using link' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')

    visit "/shelters/#{shelter_1.id}"

    click_link 'Add New Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/new")

    fill_in 'Image', with: 'https://s.abcnews.com/images/Health/200406_vod_orig_covid_pets_10_hpMain_16x9_992.jpg'
    fill_in 'Title', with: 'Very cool!'
    fill_in 'Content', with: 'I rather liked the place!'
    fill_in 'Rating', with: '5'

    click_on 'Create Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_xpath("//img[@src='https://s.abcnews.com/images/Health/200406_vod_orig_covid_pets_10_hpMain_16x9_992.jpg']")
    expect(page).to have_content('Very cool!')
    expect(page).to have_content('5')
  end

  it 'can create a flash message' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')

    visit "/shelters/#{shelter_1.id}"

    click_link 'Add New Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/new")

    fill_in 'Image', with: 'https://s.abcnews.com/images/Health/200406_vod_orig_covid_pets_10_hpMain_16x9_992.jpg'
    fill_in 'Title', with: ''
    fill_in 'Content', with: 'I rather liked the place!'
    fill_in 'Rating', with: '5'

    click_on 'Create Review'

    expect(page).to have_content('You need to fill in a title, rating, and content in order to submit a shelter review')
  end



end
