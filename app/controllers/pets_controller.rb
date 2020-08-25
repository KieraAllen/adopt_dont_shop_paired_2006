class PetsController < ApplicationController

  def index
    binding.pry
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
