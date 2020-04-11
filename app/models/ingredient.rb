class Ingredient < ApplicationRecord
  has_many :recipe_line_items
  has_many :recipes, through: :recipe_line_items
end
