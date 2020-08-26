# User Story 2, Shelter Reviews
#
# As a visitor,
# When I visit a shelter's show page,
# I see a list of reviews for that shelter
# Each review will have:
# - title
# - rating
# - content
# - an optional picture

require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  it 'can see all shelters' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')
    shelter_2 = Shelter.create(name: 'Bougie Beasts',
                               address: '2244 Ruby Ave',
                               city: 'Cedar Rapids',
                               state: 'IA',
                               zip: '52227')
    shelter_3 = Shelter.create(name: "Aurora's Animals",
                               address: '1836 Emerald St.',
                               city: 'Phoenix',
                               state: 'AZ',
                               zip: '85005')

    review_1 = Review.create(image: 'TBD',
                       title: 'Very cool!',
                       content: '102',
                       rating: 'I rather liked the place!',
                       shelter_id: shelter_1.id)
    review_2 = Review.create(image: 'ETA',
                       title: 'Okay',
                       content: 'It was not the worst',
                       rating: '3',
                       shelter_id: shelter_2.id)
    review_3 = Review.create(image: 'BYOB',
                       title: 'Pretty bad',
                       content: 'I do not think I will be back',
                       rating: '1',
                       shelter_id: shelter_3.id)

    visit '/reviews'

    expect(page).to have_text(review_1.image)
    expect(page).to have_text(review_2.image)
    expect(page).to have_text(review_3.image)
    expect(page).to have_text(review_1.title)
    expect(page).to have_text(review_2.title)
    expect(page).to have_text(review_3.title)
    expect(page).to have_text(review_1.content)
    expect(page).to have_text(review_2.content)
    expect(page).to have_text(review_3.content)
    expect(page).to have_text(review_1.rating)
    expect(page).to have_text(review_2.rating)
    expect(page).to have_text(review_3.rating)
    expect(page).to have_text(shelter_1.name)
    expect(page).to have_text(shelter_2.name)
    expect(page).to have_text(shelter_3.name)
  end
end
