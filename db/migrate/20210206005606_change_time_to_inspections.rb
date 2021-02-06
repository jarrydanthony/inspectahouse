class ChangeTimeToInspections < ActiveRecord::Migration[6.0]
  def change
    remove_column :inspections, :time
    add_column :inspections, :time, :time
  end
end
