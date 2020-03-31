class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  # accepts_nested_attributes_for :author, :pages
end
