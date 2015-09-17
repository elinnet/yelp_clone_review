class ReviewsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end


  def create #huge questions about this section
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = @restaurant.reviews.build_with_user(review_params, current_user)

      if @review.save
        redirect_to restaurants_path
      else
        if @review.errors[:user]
          flash[:notice] = 'You have already reviewed this restaurant'
          redirect_to restaurants_path
        else
          render :new
        end
      end
  end

  def destroy
    Review.find(params[:id]).delete
    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:thoughts,:rating)
  end

end
