class InspectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_inspection, only: [:edit, :show, :update, :destroy]

  def new
    @inspection = Inspection.new
  end

  def create
    @inspection = Inspection.new(inspection_params)
    @inspection.user = current_user
    @inspection.save
    redirect_to inspection_path(@inspection)
  end

  def edit
  end

  def index
    @inspections = Inspection.all
  end

  def show
    @bookings = @inspection.bookings
    @active_bookings = @bookings.where("status != :rejected AND status != :pending", { rejected: "Rejected", pending: "Pending" })
    @pending_booking = @bookings.find_by(status: "Pending")
    @booking = Booking.new
    @comments = @inspection.comments.where(private: false)
    @comment = Comment.new
  end

  def destroy
    @inspection.destroy
    redirect_to inspections_path
  end

  def update
    @inspection.update(inspection_params)
    redirect_to inspection_path
  end

  private

  def inspection_params
    params.require(:inspection).permit(:payment_amount, :location, :date, :time, :finish_time, :description)
  end

  def find_inspection
    @inspection = Inspection.find(params[:id])
  end

  def find_bookings
    @bookings = Booking.all.where.not(status: "Rejected")
  end
end
