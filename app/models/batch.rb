class Batch < ApplicationRecord
  belongs_to :recipe
  has_many :recipe_ingredients
  has_many :recipe_ingredients, through: :recipe

  def date_mm_dd_yyyy
    prep_date.strftime("%m/%d/%Y") if prep_date?
  end

  def date_short
    prep_date.strftime("%b %d, '%y") if prep_date?
  end

  def date_long
    prep_date.strftime("%B %e, %Y") if prep_date?
  end

  def concentration_percent
    concentration / 100.00
  end

end
