require 'rails_helper'

RSpec.describe Favorite do

  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      favorite = Favorite.new({
        '1' => 1,
        '2' => 1
      })
      expect(favorite.total_count).to eq(2)
    end
  end

  describe "#add_pet" do
    it "adds a pet to its contents" do
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

      pet_1 = Pet.create(image: 'TBD',
                         name: 'Drax',
                         approximate_age: '102',
                         sex: 'M',
                         shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: 'ETA',
                         name: 'Charlie',
                         approximate_age: '80',
                         sex: 'F',
                         shelter_id: shelter_2.id)
      pet_3 = Pet.create(image: 'BYOB',
                         name: 'Sparkles',
                         approximate_age: '7',
                         sex: 'F',
                         shelter_id: shelter_3.id)

      favorite = Favorite.new({
      })

      favorite.add_pet(pet_1)
      favorite.add_pet(pet_2)

      expect(favorite.favorite_pets).to eq({pet_1.id.to_s => 1, pet_2.id.to_s => 1})
    end
  end
end
