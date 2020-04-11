class RecipeLineItem < ApplicationRecord
  has_one :recipe
  belongs_to :quantity
  belongs_to :ingredient

  accepts_nested_attributes_for :quantity, :ingredient

  def calculate_batch_amount(batch)
    converted_quantity = quantity.amount * batch.multiplier
    if self.concentration_variable?
      converted_quantity * batch.concentration_percent
    else
      converted_quantity
    end
  end

end
