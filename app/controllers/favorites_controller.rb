class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :favorites

  def index
    @pets = Pet.all
  end

  # def update
  #   pet = Pet.find(params[:id])
  #   favorite = Favorite.new(session[:favorites])
  #   favorite.add_pet(pet)
  #   session[:favorites] = @favorites.contents
  #   flash[:notice] = "#{pet.name} has been added to your Favorites!"
  #   redirect_to "/pets/#{pet.id}"
  # end

  def update
    pet = Pet.find(params[:id])
    if favorites.contents.include?(pet.id.to_s)
      session[:favorites].delete(params[:id])
      flash[:notice] = "#{pet.name} has been removed from your Favorites!"
      redirect_to "/pets/#{pet.id}"
    else
      favorites.add_pet(pet)
      session[:favorites] = favorites.contents
      flash[:notice] = "#{pet.name} has been added to your Favorites!"
      redirect_to "/pets/#{pet.id}"
    end
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/favorites"
  end

end
