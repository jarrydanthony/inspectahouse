class AddInspectionToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :inspection, null: false, foreign_key: true
  end
end
