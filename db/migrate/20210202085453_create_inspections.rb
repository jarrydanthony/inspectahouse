class CreateInspections < ActiveRecord::Migration[6.0]
  def change
    create_table :inspections do |t|
      t.string :location
      t.string :string
      t.string :time
      t.string :datetime
      t.string :payment_amount
      t.string :integer
      t.string :description
      t.string :text

      t.timestamps
    end
  end
end
