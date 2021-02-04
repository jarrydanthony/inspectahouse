class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :text
    add_column :users, :username, :string
  end
end
