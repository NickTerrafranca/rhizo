module BatchesHelper
  def converted_recipe_line_item(line_item: recipe_line_item, batch: recipe_batch)
    [line_item.calculate_batch_amount(@batch), line_item.quantity.unit, line_item.ingredient.name].reject(&:blank?).join(' ')
  end
end