module BatchesHelper
  def converted_recipe_line_item(line_item: recipe_line_item, batch: recipe_batch)
    [line_item.ingredient.name, ' - ', number_with_precision(line_item.calculate_batch_amount(batch), precision: 2), line_item.quantity.unit].join(' ')
  end
end
