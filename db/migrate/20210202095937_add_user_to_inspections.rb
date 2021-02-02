class AddUserToInspections < ActiveRecord::Migration[6.0]
  def change
    add_reference :inspections, :user, null: false, foreign_key: true
  end
end
