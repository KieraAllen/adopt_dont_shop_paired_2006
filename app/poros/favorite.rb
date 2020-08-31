class Favorite
  attr_reader :contents

  def initialize(contents)
    if contents
      @favorite_pets = contents
    else
      @favorite_pets = Hash.new
    end
  end

  def total_count
    @favorite_pets.values.sum
  end

  def add_pet(pet)
    @favorite_pets[pet] = 1
  end

# maybe don't need this
  # def count_of(id)
  #   @favorite_pets[id.to_s].to_i
  # end

  # def quantity_of(pet)
  #   pet_id_str = pet.id.to_s
  #   @favorite_pets[pet_id_str]
  # end


end
