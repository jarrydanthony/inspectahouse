class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @inspections = Inspection.all

    # @markers = @inspections.geocoded.map do |ins|
    #   {
    #     lat: ins.latitude,
    #     lng: ins.longitude
    #   }
    # end
  end

  def dashboard
    home
    @current_user= current_user
    @my_bookings = current_user.bookings

    @my_inspections = current_user.inspections

    @markers = @my_inspections.geocoded.map do |ins|
      {
        lat: ins.latitude,
        lng: ins.longitude
      }
    end
  end
end
