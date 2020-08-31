class Favorite
  attr_reader :favorite_pets

  def initialize(session)
    if session
      @favorite_pets = session
    else
      @favorite_pets = Hash.new
    end
  end

  def total_count
    @favorite_pets.values.sum
  end

  def add_pet(pet)
    pet_id_str = pet.id.to_s
    @favorite_pets[pet_id_str] = 1
  end


end
