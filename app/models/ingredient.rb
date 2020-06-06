class Ingredient < ApplicationRecord
  has_many :recipe_line_items
  has_many :recipes, through: :recipe_line_items

  before_validation :strip_whitespace
  before_save :find_or_create_ingredient

  validates :name, presence: true#, uniqueness: true

  private
    def strip_whitespace
      name.strip! if name?
    end

    def find_or_create_ingredient
    # binding.pry
    # if Ingredient.where(name: Ingredient.last.name)
      # ing_name  = self.name
      # Ingredient.where(name: Ingredient.last.name).order(created_at: :asc).first
    #   Ingredient.where(name: ing_name).order(:desc)
    end
end
