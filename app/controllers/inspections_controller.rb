class InspectionsController < ApplicationController
  before_action :find_inspection, only: [:edit, :show, :update, :destroy]

  def new
    @inspection = Inspection.new
  end

  def create
    @inspection = Inspection.create(inspection_params)
  end

  def edit
  end

  def index
    @inspections = Inspection.all
  end

  def show
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
    params.require(:inspection).permit(:payment_amount, :location, :datetime, :description)
  end

  def find_inspection
    @inspection = Inspection.find(params[:id])
  end


end
