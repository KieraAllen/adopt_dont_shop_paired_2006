require 'rails_helper'

RSpec.describe Favorite do
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
  end

  subject { Favorite.new({@pet_1.id.to_s => 2, @pet_2.id.to_s => 3}) }

  describe "#total_count" do
    it "calculates the total number of pets it holds" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "#add_pet" do
    it "adds a pet to its contents" do

      subject.add_pet(@pet_1)
      subject.add_pet(@pet_2)

      expect(subject.contents).to eq({@pet_1.id.to_s => 3, @pet_2.id.to_s => 4})
    end
  end

  describe "#count_of" do
  it "returns the count of all pets in the favorites" do
      @favorites = Favorite.new({})

      expect(favorites.count_of(5)).to eq(0)
    end
  end


  it "adds a pet that hasn't been added yet" do
    subject.add_pet('3')

    expect(subject.contents).to eq({'1' => 2, '2' => 3, '3' => 1})
  end
end
