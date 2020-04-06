class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :delete_all
  has_many :quantities, through: :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :batches
  accepts_nested_attributes_for :recipe_ingredients
end
