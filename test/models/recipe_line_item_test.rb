require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  def setup
    @recipe = recipes(:catfood)
    @bad_recipe_line_item = @recipe.recipe_line_items.new
    @good_recipe_line_item = recipe_line_items(:recipe_line_item_one)
  end

  test 'should not be valid with missing forign keys' do
    assert_not @bad_recipe_line_item.valid?
  end

  test 'should be valid' do
     assert @good_recipe_line_item.valid?
  end

  # test 'title should be present' do
  #   @recipe.title = '     '
  #   assert_not @recipe.valid?
  # end

  # test 'description should be present' do
  #   @recipe.description = '     '
  #   assert_not @recipe.valid?
  # end
end
