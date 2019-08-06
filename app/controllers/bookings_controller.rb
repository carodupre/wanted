class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def show
    @service = Service.find(@booking.service_id)
    @category = Category.find(@service.category_id)
    @user = User.find(@service.user_id)
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
    @booking.service_id = params[:service_id]
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.service_id = params[:service_id]
    @booking.total_price = @booking.duration * Service.find(params[:service_id]).price_per_hour
    if @booking.save
      redirect_to services_path
    else
      render 'new'
    end
  end

  def edit
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(params[:id]), notice: 'Booking was successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :duration, :total_price, :address, :user_id, :service_id)
  end
end
