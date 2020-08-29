require 'rails_helper'

RSpec.describe Favorites do
  subject { Favorites.new({'1' => 2, '2' => 3}) }

  describe "#total_count" do
    it "calculates the total number of pets it holds" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "#add_pet" do
    it "adds a pet to its contents" do
      favorites = Favorites.new({
        '1' => 2,  # two copies of pet 1
        '2' => 3   # three copies of pet 2
      })
      subject.add_pet(1)
      subject.add_pet(2)

      expect(subject.contents).to eq({'1' => 3, '2' => 4})
    end
  end

  describe "#count_of" do
  it "returns the count of all pets in the favorites" do
      favorites = Favorites.new({})

      expect(favorites.count_of(5)).to eq(0)
    end
  end


  it "adds a pet that hasn't been added yet" do
    subject.add_pet('3')

    expect(subject.contents).to eq({'1' => 2, '2' => 3, '3' => 1})
  end
end
