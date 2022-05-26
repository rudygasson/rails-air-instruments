class InstrumentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all
    @search_term = params[:search][:instrument_type]
    @filtered_instruments = @instruments.where('lower(instrument_type) like ?', "%#{@search_term.downcase}%")
    $search_path = "/instruments?search%5Binstrument_type%5D=#{@search_term}&commit=Search"
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

  # private

  def instrument_params
    params.require(:instrument).permit(
      :instrument_type,
      :model,
      :description,
      :location,
      :price_per_day
    )
  end

  # def set_instrument
  #   @instrument = Instrument.find(params[:id])
  # end
end
