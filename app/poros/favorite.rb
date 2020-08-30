class Favorite
  attr_reader :contents

  def initialize(contents)
    if contents
      @contents = contents
    else
      @contents = Hash.new
    end
  end

  def total_count
    # binding.pry
    @contents.values.sum
  end

  def add_pet(id)
    pet_id_str = pet.id.to_s
    @contents[pet_id_str] ||= 0
    @contents[pet_id_str] += 1
  end

  def count_of(id)
    @contents[id.to_s].to_i
  end

  def quantity_of(pet)
    pet_id_str = pet.id.to_s
    @contents[pet_id_str]
  end


end
