class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @pets = Pet.all
  end

  def update
    pet = Pet.find(params[:id])
    favorite = Favorite.new(session[:favorites])
    favorite.add_pet(pet)

    session[:favorites] = @favorites.contents
    flash[:notice] = "You now have #{pluralize(favorites.quantity_of(pet), 'copy')} of #{pet.name} in your Favorites."

    request.referrer

  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/favorites"
  end

end
