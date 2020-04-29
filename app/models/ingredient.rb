class Ingredient < ApplicationRecord
  has_many :recipe_line_items
  has_many :recipes, through: :recipe_line_items
  before_validation :strip_whitespace
  validates :name, presence: true

  private
    def strip_whitespace
      name.strip! if name?
    end
end
