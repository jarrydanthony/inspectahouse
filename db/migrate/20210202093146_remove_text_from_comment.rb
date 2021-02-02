class RemoveTextFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :text, :string
  end
end
