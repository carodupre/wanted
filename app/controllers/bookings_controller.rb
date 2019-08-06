class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to dashobard
    else
      render "new"
    end
  end

  def edit
  end

   def update
      @booking.update(booking_params)
      if @booking.save
        redirect_to dashboard
      else
        render "edit"
      end
    end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:duration, :total_price, :address, :service_id)
  end

end
