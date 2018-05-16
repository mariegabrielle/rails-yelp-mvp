class ReviewsController < ApplicationController
  before_action :set_review, only: [:index, :new, :create]

  # def index
  #   @reviews = @restaurant.reviews
  # end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private
  def review_params
      params.require(:review).permit(:content, :rating)
  end

  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
