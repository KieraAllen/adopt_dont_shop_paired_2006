class Shelters::PetsController < ApplicationController
  def index
    @pets = Pet.where(shelter_id: params[:id])
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    if pet_params.values.any?('') == false
      shelter.pets.create(pet_params)
      redirect_to "/shelters/#{params[:id]}/pets"
    else
      redirect_to "/shelters/#{params[:id]}/pets/new", danger: 'You need to fill in a name, description, approximate_age, sex, and image in order to submit a pet'
    end
  end
  
  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:image,
                  :name,
                  :description,
                  :approximate_age,
                  :sex)
  end

  def shelter_params
    params.permit(:name,
                  :address,
                  :city,
                  :state,
                  :zip)
  end
end
