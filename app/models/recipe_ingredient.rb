class RecipeIngredient < ApplicationRecord
  has_many :recipes
  belongs_to :unit
  belongs_to :quantity
  belongs_to :item
  accepts_nested_attributes_for :unit, :quantity, :item
end
