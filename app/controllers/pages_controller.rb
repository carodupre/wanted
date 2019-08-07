class PagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def dashboard
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
    @my_services = Service.where(user_id: @user.id)

    @been_booked = []
    @my_services.each do |x|
      @been_booked += Booking.where(service_id: x.id)
      return @been_booked
    end
  end
end
