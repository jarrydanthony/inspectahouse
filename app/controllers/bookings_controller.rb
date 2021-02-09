class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :submit, :complete]
  def create
    @booking = Booking.new(booking_params)
    @booking.inspection_id = params[:inspection_id]
    @booking.user = current_user
    @booking.save
    redirect_to inspection_path(@booking.inspection)
  end

  def show
  end

  def submit
    @booking.status = "Submitted"
    @booking.save
    redirect_to booking_path(@booking)
  end

  def complete
    @booking.status = "Completed"
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:note)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
