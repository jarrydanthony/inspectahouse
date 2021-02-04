class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create!(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:note)
  end
end
