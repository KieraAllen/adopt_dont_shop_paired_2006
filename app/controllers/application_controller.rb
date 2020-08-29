class ApplicationController < ActionController::Base
  add_flash_types :danger
  helper_method :favorites

  def favorites
    @favorites ||= Favorites.new(session[:favorites])
  end
end
