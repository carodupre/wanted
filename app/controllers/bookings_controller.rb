class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
    @service = Service.find(@booking.service_id)
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    @booking.service_id = params[:service_id]
  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    @booking.user = current_user
    @booking.total_price = @booking.duration * @service.price_per_hour
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(params[:id]), notice: 'Booking was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :duration, :total_price, :address, :user_id, :service_id)
  end
end
