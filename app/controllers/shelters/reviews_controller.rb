class Shelters::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(shelter_id: params[:id])
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    if review_params.values.any?('') == false
      shelter.reviews.create(review_params)
      redirect_to "/shelters/#{params[:id]}/reviews"
    else
      redirect_to "/shelters/#{params[:id]}/review/new", danger: 'You need to fill in a title, rating, and content in order to submit a shelter review'
    end
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to "/reviews"
  end

  private

  def review_params
    params.permit(:title,
                  :rating,
                  :content,
                  :image)
  end

  def shelter_params
    params.permit(:name,
                  :address,
                  :city,
                  :state,
                  :zip)
  end
end
