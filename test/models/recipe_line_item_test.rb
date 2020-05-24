require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase

  def setup
    @recipe = recipes(:catfood)
    @bad_recipe_line_item = @recipe.recipe_line_items.new
    @recipe_line_item_not_variable = recipe_line_items(:recipe_line_item_one)
    @recipe_line_item_variable = recipe_line_items(:recipe_line_item_two)
    @two_times_batch_normal_strength = batches(:two_times_batch_normal_consentration)
    @one_times_batch_half_strength = batches(:one_times_batch_half_consentration)
  end

  test 'should not be valid with missing forign keys' do
    assert_not @bad_recipe_line_item.valid?
  end

  test 'should be valid' do
     assert @recipe_line_item_not_variable.valid?
  end

  test 'should be have at least one quantity' do
     assert @recipe_line_item_not_variable.quantity.present?
  end

  test 'should be have at least one ingredient' do
     assert @recipe_line_item_not_variable.ingredient.present?
  end

  test 'should corectly convert child quantity amount based on the Batch multiplier' do
    amount = @recipe_line_item_not_variable.quantity.amount
    new_amount = @recipe_line_item_not_variable.calculate_batch_amount(@two_times_batch_normal_strength)
    assert_not_equal amount, new_amount
    assert amount * 2 == new_amount
  end

  test 'should corectly convert child quantity amount based on the Batch concentration' do
    amount = @recipe_line_item_variable.quantity.amount
    new_amount = @recipe_line_item_variable.calculate_batch_amount(@one_times_batch_half_strength)
    assert_not_equal amount, new_amount
    assert amount / 2 == new_amount
  end
end
