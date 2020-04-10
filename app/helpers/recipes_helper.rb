module RecipesHelper
  def recipe_ingredient_line_item(recipe_ingredient)
    [recipe_ingredient.quantity.amount, recipe_ingredient.quantity.unit, recipe_ingredient.ingredient.name].reject(&:blank?).join(' ')
  end
end
