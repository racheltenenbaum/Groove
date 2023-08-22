class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :available_from, :description, :brand, :price, :city, :user_id)
  end
end
