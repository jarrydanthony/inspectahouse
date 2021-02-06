class RemoveColumnFromInspections < ActiveRecord::Migration[6.0]
  def change
    remove_column :inspections, :integer, :string
    remove_column :inspections, :text, :string
  end
end
