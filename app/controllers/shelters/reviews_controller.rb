class Shelters::ReviewsController < ApplicationController

  def index
    # binding.pry
    @reviews = Review.where(shelter_id: params[:id])
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.reviews.create(pet_params)
    redirect_to "/shelters/#{params[:id]}/reviews"
  end

  private

  def pet_params
    params.permit(:title,
                  :rating,
                  :content,
                  :image)
  end
end
