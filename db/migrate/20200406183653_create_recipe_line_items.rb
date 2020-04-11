class CreateRecipeLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_line_items do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :quantity, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.boolean :concentration_variable, null: false, default: true

      t.timestamps
    end
  end
end
