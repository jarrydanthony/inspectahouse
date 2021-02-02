class AddInspectionToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :inspection, null: false, foreign_key: true
  end
end
