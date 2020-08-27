class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new; end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to "/reviews/#{@review.id}"
  end


  private

  def review_params
    params.permit(:title,
                  :rating,
                  :content,
                  :image)
  end
end
