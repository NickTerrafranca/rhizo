class RecipeLineItem < ApplicationRecord
  has_one :recipe
  belongs_to :quantity, dependent: :destroy
  belongs_to :ingredient, dependent: :destroy

  before_save :find_or_create_ingredient

  accepts_nested_attributes_for :quantity, :ingredient#, allow_destroy: true

  def calculate_batch_amount(batch)
    converted_quantity = quantity.amount * batch.multiplier
    if self.concentration_variable?
      converted_quantity * batch.concentration_percent
    else
      converted_quantity
    end
  end



  private

  def find_or_create_ingredient
    # binding.pry
    # if Ingredient.find(self.ingredient_id)
    #   ing_name  = Ingredient.find(self.ingredient_id).name
    #   Ingredient.where(name: ing_name).order(:desc)
    # end
  end

end
