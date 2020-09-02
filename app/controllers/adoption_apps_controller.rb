class AdoptionAppsController < ApplicationController

  def index
    @adoption_apps = AdoptionApp.all
    @pets = Pet.all
  end

  def new
    @pets = Pet.all
  end

  def create
    @pets = Pet.all
    AdoptionApp.create(adoption_app_params)
    # require "pry"; binding.pry
    # favorites.favorite_pets.each do |favorite_pet|
    #   something_that_stores_the_checked_data.each do |data|
    #     if data.pet_id == favorite_pet[0].to_i
    #       flash[:notice] = "Your application for #{pet.name} has been submitted!"
    #
    #       #something that removes the selected pets from favorites
    #       session[:favorites].delete(pet)
    #     end
    #   end
    # end
    redirect_to '/favorites'
  end

  private

  def adoption_app_params
    params.permit(:name,
                  :address,
                  :city,
                  :state,
                  :zip,
                  :phone_number,
                  :description,
                  :creep_status)
  end
end
