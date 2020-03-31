class RecipeIngredient < ApplicationRecord
  has_many :recipes
  belongs_to :unit
  belongs_to :quantity
  belongs_to :ingredient
end
