module BatchesHelper
  def converted_recipe_line_item(ingredient: recipe_ingredient, batch: recipe_batch)
    [ingredient.calculate_batch_amount(@batch), ingredient.quantity.unit, ingredient.ingredient.name].reject(&:blank?).join(' ')
  end
end
