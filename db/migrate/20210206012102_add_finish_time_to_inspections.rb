class AddFinishTimeToInspections < ActiveRecord::Migration[6.0]
  def change
    add_column :inspections, :finish_time, :time
  end
end
