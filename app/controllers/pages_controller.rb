class PagesController < ApplicationController
  def home
  end

  def dashboard
    @my_bookings = current_user.bookings
    
    @my_inspection_bookings = []
    @my_inspections = current_user.inspections

    @my_inspections.each do |inspection| 
      @my_inspection_bookings << inspection.bookings
    end

  end

end
