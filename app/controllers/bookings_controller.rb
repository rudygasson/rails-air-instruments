class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.instrument = @instrument
    if @booking.save
      redirect_to root_path
    else
      render('instruments/show', status: :unprocessable_entity)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
