class AddBookingIdToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :booking_id, :string
  end
end
