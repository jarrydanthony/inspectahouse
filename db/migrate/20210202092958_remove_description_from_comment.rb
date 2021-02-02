class RemoveDescriptionFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :description, :string
  end
end
