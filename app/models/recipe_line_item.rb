class RecipeLineItem < ApplicationRecord
  has_one :recipe
  belongs_to :quantity
  belongs_to :ingredient

  before_save :check_existing_ingredient, :check_existing_quantity

  accepts_nested_attributes_for :quantity, :ingredient

  def calculate_batch_amount(batch)
    converted_quantity = quantity.amount * batch.multiplier
    if self.concentration_variable?
      converted_quantity * batch.concentration_percent
    else
      converted_quantity
    end
  end

  private

    def check_existing_ingredient
      new_record = Ingredient.find self.ingredient_id
      if first_existing = Ingredient.where(name: new_record.name).where.not(id: new_record.id).order(created_at: :asc).first
        self.ingredient_id = first_existing.id
        new_record.destroy
      end
    end

    def check_existing_quantity
      new_record = Quantity.find(self.quantity_id)
      if first_existing = Quantity.where(unit: new_record.unit, amount: new_record.amount).where.not(id: new_record.id).order(created_at: :asc).first
        self.quantity_id = first_existing.id
        new_record.destroy
      end
    end

end
