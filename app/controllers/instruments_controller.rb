class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
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
