class ReviewsController < ApplicationController
  before_action :set_instrument, only: [:create, :new]

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.instrument_id = @instrument.id
    @review.user_id = current_user.id
    if @review.save
      # flash[:notice] = 'Review was successfully created.'
      redirect_to instrument_path(@instrument.id)
    else
      render :reviews, status: :unprocessable_entity
    end
  end


  def destroy
    @instrument = Instrument.find(params[:instrument_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(@review.post)
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
