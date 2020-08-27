class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:id])
    flash[:notice] = "you now have now favorited #{pet.name}"
    request.referrer
  end
end
