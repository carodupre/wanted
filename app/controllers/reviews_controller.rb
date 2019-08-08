class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id]) #maiybe not needed as we pass it in review param)
    @service = Service.find(@booking.service_id)
    @review.booking = @booking
    if @review.save
      redirect_to service_path(@service.id)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:title, :description, :booking_id)
  end
end

