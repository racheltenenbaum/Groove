class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = @instrument.user_id
    @booking.instrument_id = @instrument.id
    if @booking.save
      redirect_to bookings_path, notice: "booking was successfully created."
    else
      render :bookings, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    # No need for app/views/bookings/update.html.erb
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    # @list = @booking.list
    @booking.destroy
    redirect_to booking_path(@booking), notice: "booking was successfully destroyed.", status: :see_other
  end


  private

  def booking_params
    params.require(:booking).permit(:user_id, :instrument_id, :start_date, :end_date)
  end

end
