
require 'rails_helper'

RSpec.describe 'shelter reviews index page', type: :feature do
  it 'can only see reviews from specific shelter' do
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

    review_1 = Review.create( image: 'TBD',
                              title: 'Very cool!',
                              content: 'I rather liked the place!',
                              rating: '5',
                              shelter_id: shelter_1.id)
    review_2 = Review.create( image: 'ETA',
                              title: 'Okay',
                              content: 'It was not the worst',
                              rating: '3',
                              shelter_id: shelter_1.id)
    review_3 = Review.create( image: 'BYOB',
                              title: 'Pretty bad',
                              content: 'I do not think I will be back',
                              rating: '1',
                              shelter_id: shelter_2.id)

  visit "/shelters/#{shelter_1.id}/reviews"

    expect(page).to have_text(review_1.image)
    expect(page).to have_text(review_2.image)
    expect(page).to_not have_text(review_3.image)
    expect(page).to have_text(review_1.title)
    expect(page).to have_text(review_2.title)
    expect(page).to_not have_text(review_3.title)
    expect(page).to have_text(review_1.content)
    expect(page).to have_text(review_2.content)
    expect(page).to_not have_text(review_3.content)
    expect(page).to have_text(review_1.rating)
    expect(page).to have_text(review_2.rating)
    expect(page).to have_text(shelter_1.name)
    expect(page).to_not have_text(shelter_2.name)
  end
end
