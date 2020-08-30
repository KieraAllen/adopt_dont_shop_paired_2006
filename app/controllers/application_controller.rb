class ApplicationController < ActionController::Base
  add_flash_types :danger
  helper_method :favorites
  before_action :favorites

  def favorites
    @favorites ||= Favorite.new(session[:favorites])
  end
end
