class Shelters::PetsController < ApplicationController

  def index
    # binding.pry
    @pets = Pet.where(shelter_id: params[:id])
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create(pet_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.pets.destroy(pet_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  private

  def pet_params
    params.permit(:image,
                  :name,
                  :description,
                  :approximate_age,
                  :sex)
  end
end
