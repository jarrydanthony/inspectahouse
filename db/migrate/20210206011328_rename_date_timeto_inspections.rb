class RenameDateTimetoInspections < ActiveRecord::Migration[6.0]
  def change
    remove_column :inspections, :datetime
    add_column :inspections, :date, :date
  end
end
