class PagesController < ApplicationController

  def home
  end

  def dashboard
    @booking = Booking.where(current_user.id == booking.user_id)
  end
end
