class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "booking was successfully created."
    else
      render :index, status: :unprocessable_entity
    end
  end

end
