class PackagesController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    # the four lines below probably would be best delegated to a PackageCreator PORO
    package = Package.new(user_name: "Rachel")
    favorites.contents.each do |pet_id, quantity|
      package.pets.new(pet_id: pet_id, quantity: quantity)
    end

    if package.save
      session[:favorites] = nil
      flash[:notice] = "Your bag is packed! You packed #{package.pets.count} pets."
      redirect_to '/'
    else
      # implement if you have validations
    end
  end
end
