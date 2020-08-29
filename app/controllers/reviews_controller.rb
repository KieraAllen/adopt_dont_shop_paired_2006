class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    if review.save
      redirect_to "/shelters/#{@review.shelter.id}"
    else
      redirect_to "/shelters/#{params[:id]}/reviews/new", danger: 'You need to fill in a title, rating, and content in order to submit a shelter review'
    end
  end


  private

  def review_params
    params.permit(:title,
                  :rating,
                  :content,
                  :image)
  end
end
