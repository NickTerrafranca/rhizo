module RecipesHelper
  def recipe_ingredient_line_item(recipe_line_item)
    [recipe_line_item.quantity.amount, recipe_line_item.quantity.unit, recipe_line_item.ingredient.name].reject(&:blank?).join(' ')
  end
end
