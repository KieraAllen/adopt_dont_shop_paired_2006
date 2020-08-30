class WelcomeController < ApplicationController
  def index
    @favorites = Favorite.new(session[:favorites])
  end
end
