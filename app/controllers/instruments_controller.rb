class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
    @search_term = params[:search][:instrument_type]
    @filtered_instruments = @instruments.where(instrument_type: @search_term)
  end
end
