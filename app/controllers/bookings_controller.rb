class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :accept, :reject]
  def create
    @booking = Booking.new(booking_params)
    @booking.inspection_id = params[:inspection_id]
    @booking.user = current_user
    @booking.save
    redirect_to inspection_path(@booking.inspection)
  end

  def show
  end

  def accept
    @booking.status = "Accepted"
    @booking.save
    redirect_to inspection_path(@booking.inspection)
  end

  def reject
    @booking.status = "Rejected"
    @booking.save
    redirect_to inspection_path(@booking.inspection)
  end

  private

  def booking_params
    params.require(:booking).permit(:note)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
