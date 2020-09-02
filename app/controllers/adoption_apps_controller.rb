class AdoptionAppsController < ApplicationController

  def index
    @adoption_apps = AdoptionApp.all
    @pets = Pet.all
  end

  def new
    @pets = Pet.all
  end

  def create
    AdoptionApp.create(adoption_app_params)
    #something that removes the selected pets from favorites
    
    # session[:favorites].delete(params[:id])
    # flash[:notice] = "#{pet.name} has been removed from your Favorites!"

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
