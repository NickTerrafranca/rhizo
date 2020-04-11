class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_line_items, dependent: :delete_all
  has_many :quantities, through: :recipe_line_items
  has_many :ingredients, through: :recipe_line_items
  has_many :batches
  accepts_nested_attributes_for :recipe_line_items
end
