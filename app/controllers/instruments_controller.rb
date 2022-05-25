class InstrumentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @instruments = Instrument.all
    if params[:search]
      @search_term = params[:search][:instrument_type]
      @filtered_instruments = @instruments.where('lower(instrument_type) like ?', "%#{@search_term.downcase}%")
    else
      @filtered_instruments = @instruments
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
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
