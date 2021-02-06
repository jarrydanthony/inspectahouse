class InspectionsController < ApplicationController
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
    @active_booking = @bookings.find_by(status: "Active")
    @pending_booking = @bookings.find_by(status: "Pending")
    @booking = Booking.new
  end

  def destroy
    @inspection.destroy
    # redirect_to
  end

  def update
    @inspection.update(params[:inspection])
  end

  private

  def inspection_params
    params.require(:inspection).permit(:payment_amount, :location, :date, :time, :finish_time, :description)
  end

  def find_inspection
    @inspection = Inspection.find(params[:id])
  end

  def find_bookings
    
  end
end
