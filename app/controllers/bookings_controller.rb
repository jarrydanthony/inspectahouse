class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]
  def create
    @booking = Booking.create!(booking_params)
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:note)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
