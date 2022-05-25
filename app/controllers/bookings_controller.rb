class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new
  end

  def create
  end
end
