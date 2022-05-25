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
  end

  def new
  end

  def create
  end

  # private

  # def set_instrument
  #   @instrument = Instrument.find(params[:id])
  # end
end
