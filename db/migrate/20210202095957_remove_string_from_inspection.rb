class RemoveStringFromInspection < ActiveRecord::Migration[6.0]
  def change
    remove_column :inspections, :string, :string
  end
end
