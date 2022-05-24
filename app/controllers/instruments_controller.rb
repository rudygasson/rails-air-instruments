class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
    @search_term = params[:search][:instrument_type]
    @filtered_instruments = @instruments.where('lower(instrument_type) like ?', "%#{@search_term.downcase}%")
  end
end
