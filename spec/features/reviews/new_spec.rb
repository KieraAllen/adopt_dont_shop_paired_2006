

require 'rails_helper'

RSpec.describe 'creating a new review' do
  it 'can create a review' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')

    visit "/shelters/#{shelter_1.id}/reviews"

    click_link 'Create Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/review/new")

    fill_in 'Image', with: 'TBD'
    fill_in 'Title', with: 'Very cool!'
    fill_in 'Content', with: 'I rather liked the place!'
    fill_in 'Rating', with: '5'

    click_on 'Create Review'

    new_review = Review.last

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews")
    expect(page).to have_content('TBD')
    expect(page).to have_content('Very cool!')
    expect(page).to have_content(new_review.title)
    expect(page).to have_content('5')
  end
end
