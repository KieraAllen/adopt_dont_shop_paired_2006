class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to '/reviews'
  end
end
