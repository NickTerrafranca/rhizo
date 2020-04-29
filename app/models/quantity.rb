class Quantity < ApplicationRecord
  has_many :recipe_line_items
  has_many :recipes, through: :recipe_line_items

  ALLOWED_UNITS = ['ml','ltr', 'mg', 'gram', 'gal', 'tsp', 'tbsp', 'cup', 'lb', 'qt', 'pt']

  before_validation :strip_whitespace
  before_save :downcase_unit
  validates :unit, presence: true, format: { with: /\A[a-z]+\z/ }, inclusion: { in: ALLOWED_UNITS, message: "%{value} is not valid" }
  validates :amount, :amount, presence: true, numericality: true

  def unit_options_for_select
    ALLOWED_UNITS
  end

  private
    def strip_whitespace
      unit.strip! unless unit.nil?
    end

    def downcase_unit
      unit.downcase!
    end
end
