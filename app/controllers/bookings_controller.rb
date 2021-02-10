class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :submit, :complete, :accept, :reject, :edit, :update, :destroy ]
  before_action :find_comments, only: [:show ]

  def create
    @booking = Booking.new(booking_params)
    @booking.inspection_id = params[:inspection_id]
    @booking.user = current_user
    @booking.save
    redirect_to inspection_path(@booking.inspection)
  end

  def show
    @inspection = @booking.inspection
    @comment = Comment.new
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
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

  def destroy
    @booking.destroy
    redirect_to inspection_path(@booking.inspection)
  end

  private

  def booking_params
    params.require(:booking).permit(:note, photos: [])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_comments
    @comments = @booking.inspection.comments.where(booking_id: @booking.id)
  end
end
