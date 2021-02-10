class PagesController < ApplicationController
  def home
  end

  def dashboard
    @my_bookings = current_user.bookings

    @my_inspections = current_user.inspections
  end

end
