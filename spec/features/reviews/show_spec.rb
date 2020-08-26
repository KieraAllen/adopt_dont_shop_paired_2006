require 'rails_helper'

RSpec.describe 'reviews show page', type: :feature do
  it 'can see the review with that id including attributes' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')
    review_1 = Review.create( image: 'TBD',
                              title: 'Very cool!',
                              content: 'I rather liked the place!',
                              rating: '5',
                              shelter_id: shelter_1.id)

    visit "/reviews/#{review_1.id}"

    expect(page).to have_text(review_1.image)
    expect(page).to have_text(review_1.title)
    expect(page).to have_text(review_1.content)
    expect(page).to have_text(review_1.rating)
  end
end
