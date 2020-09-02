require 'minitest/autorun'
require 'minitest/pride'
require './spec/poro/favorite_poro_spec.rb'
# require './spec/poro/favorite.rb'

class FavoriteTest < Minitest::Test
  def test_it_exists
    pet_1 = Pet.create(image: 'TBD',
                        name: 'Drax',
                        approximate_age: '102',
                        sex: 'M',
                        shelter_id: @shelter_1.id)
    favorites = Favorite.new(pet_1)

    assert_instance_of Favorite, favorites
  end

  # def test_total_count
  #
  #
  # end
  #
  # def test_add_pet
  #
  # end

end
