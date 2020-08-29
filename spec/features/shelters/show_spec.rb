require 'rails_helper'

RSpec.describe 'shelters show page', type: :feature do
  it 'can see the shelter with that id including attributes' do
    shelter_1 = Shelter.create(name: "The Dragon's Dream",
                               address: '1554 Diamond Lane',
                               city: 'Destin',
                               state: 'FL',
                               zip: '32540')

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_text(shelter_1.name)
    expect(page).to have_text(shelter_1.address)
    expect(page).to have_text(shelter_1.city)
    expect(page).to have_text(shelter_1.state)
    expect(page).to have_text(shelter_1.zip)
  end

  it 'can see reviews for shelter' do
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

    review_1 = Review.create( image: 'https://www.aspca.org/sites/default/files/styles/latest_story_465x458/public/field/image/blog/blog_separation-anxiety_082720_thumb.jpg?itok=99rlR42z',
                              title: 'Very cool!',
                              content: 'I rather liked the place!',
                              rating: '5',
                              shelter_id: shelter_1.id)
    review_2 = Review.create( title: 'Okay',
                              content: 'It was not the worst',
                              rating: '3',
                              shelter_id: shelter_1.id)
    review_3 = Review.create( title: 'Pretty bad',
                              content: 'I do not think I will be back',
                              rating: '1',
                              shelter_id: shelter_2.id)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_xpath("//img[@src='#{review_1.image}']")
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
