class AddCoordinatesToInspections < ActiveRecord::Migration[6.0]
  def change
    add_column :inspections, :latitude, :float
    add_column :inspections, :longitude, :float
  end
end
