class RemoveCommentFromInspections < ActiveRecord::Migration[6.0]
  def change
    remove_reference :inspections, :comment, null: false, foreign_key: true
  end
end
