class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true

      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :recipes, :title
  end
end
