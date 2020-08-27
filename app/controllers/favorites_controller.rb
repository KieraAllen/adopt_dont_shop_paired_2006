class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:pet_id])
    flash[:notice] = "you now have now favorited #{pet.name}"
    request.referrer
  end
end
