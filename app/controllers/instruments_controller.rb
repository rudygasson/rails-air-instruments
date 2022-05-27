class InstrumentsController < ApplicationController
  IMAGE_PLACEHOLDER_URL = "https://media.istockphoto.com/photos/musical-instruments-picture-id894058154?b=1&k=20&m=894058154&s=612x612&w=0&h=KP5mDmuL2itWbbaG2BHUGTxOBFiK56mCvmB_6O6cm4A="
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all
    @search_term = params[:query]
    @filtered_instruments = @instruments.where('instrument_type ILIKE ?', "%#{@search_term.downcase}%")
    $search_path = "/instruments?query=#{@search_term}"
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
  end

  def new
    @user = current_user
    @instrument = Instrument.new
  end

  def create
    @user = current_user
    @instrument = Instrument.new(instrument_params)
    @instrument.user = @user
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to profile_path(current_user), status: :see_other
  end

  # private

  def instrument_params
    params.require(:instrument).permit(
      :instrument_type,
      :model,
      :description,
      :location,
      :price_per_day,
      :photo
    )
  end

  # def set_instrument
  #   @instrument = Instrument.find(params[:id])
  # end
end
