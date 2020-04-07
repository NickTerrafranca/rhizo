class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :notes
      t.float :multiplier, precision: 6, scale: 2, null: false
      t.float :concentration, precision: 3, scale: 2, null: false
      t.date :prep_date

      t.timestamps
    end
  end
end
