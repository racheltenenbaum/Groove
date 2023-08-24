class InstrumentsController < ApplicationController
  def index

    if params[:query].present?
      @instruments = Instrument.search_by_name_and_description(params[:query])

      @markers = @instruments.geocoded.map do |instrument|
        {
          lat: instrument.latitude,
          lng: instrument.longitude,
          # info_window: "<h1>hello</h1>"
          info_window: render_to_string(partial: "info_window", locals: { instrument: instrument} )
          marker_html: render_to_string(partial: "marker", locals: { instrument: instrument})
        }
      end
    else
      @instruments = Instrument.all
      @markers = @instruments.geocoded.map do |instrument|
        {
          lat: instrument.latitude,
          lng: instrument.longitude,
          info_window: render_to_string(partial: "/instruments/info_window", locals: { instrument: instrument} )
          marker_html: render_to_string(partial: "marker", locals: { instrument: instrument})
        }

      end

    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      redirect_to instruments_path
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    if @instrument.save
      redirect_to instrument_path(@instrument.id)
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :available_from, :description, :brand, :price, :city, :photo)
  end
end
