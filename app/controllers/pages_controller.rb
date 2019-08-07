class PagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
  end
end
