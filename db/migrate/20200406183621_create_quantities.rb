class CreateQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :quantities do |t|
      t.string :unit, null: false
      t.float :amount, precision: 9, scale: 2, null: false

      t.timestamps
    end
  end
end
