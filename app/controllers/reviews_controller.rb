# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = @restaurant.reviews.build
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Reseña agregada exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
