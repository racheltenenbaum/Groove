class PagesController < ApplicationController

  def home
  end

  def dashboard
    @bookings = Booking.all
    @instruments = Instrument.all
    # @instrument = Instrument.find()
  end
end
