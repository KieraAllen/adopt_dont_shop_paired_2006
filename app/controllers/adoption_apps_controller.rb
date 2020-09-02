class AdoptionAppsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pets = Pet.all
  end

  private

  def shelter_params
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
