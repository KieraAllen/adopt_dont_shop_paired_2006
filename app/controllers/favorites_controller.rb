class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @pets = Pet.all
  end

  def update
    # @favorites = 
    pet = Pet.find(params[:id])
    @favorites.add_pet(pet.id)
    session[:favorites] = @favorites.contents
    quantity = @favorites.count_of(pet.id)
    flash[:notice] = "You now have #{pluralize(quantity, 'copy')} of #{pet.name} in your Favorites."
    request.referrer

  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/favorites"
  end

end
