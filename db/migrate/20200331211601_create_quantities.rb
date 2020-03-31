class CreateQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :quantities do |t|
      t.decimal :amount, null: false, unique: true

      t.timestamps
    end
  end
end
