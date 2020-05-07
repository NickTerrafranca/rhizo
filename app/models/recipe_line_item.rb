class RecipeLineItem < ApplicationRecord
  has_one :recipe
  belongs_to :quantity, dependent: :destroy
  belongs_to :ingredient, dependent: :destroy

  accepts_nested_attributes_for :quantity, :ingredient, allow_destroy: true

  def calculate_batch_amount(batch)
    converted_quantity = quantity.amount * batch.multiplier
    if self.concentration_variable?
      converted_quantity * batch.concentration_percent
    else
      converted_quantity
    end
  end

end
