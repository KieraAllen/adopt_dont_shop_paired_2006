class AdoptionAppsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pets = Pet.all
  end


end
