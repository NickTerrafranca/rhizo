module BatchesHelper
  def converted_recipe_line_item(line_item: recipe_line_item, batch: recipe_batch)
    [line_item.ingredient.name, ' - ', line_item.calculate_batch_amount(batch), line_item.quantity.unit].reject(&:blank?).join(' ')
  end
end
