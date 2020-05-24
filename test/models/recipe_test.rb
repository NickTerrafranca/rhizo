require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = recipes(:catfood)
    @blank_recipe = recipes(:no_associations)
  end

  test 'should be valid' do
    assert @recipe.valid?
    assert @blank_recipe.valid?
  end

  test 'title should be present' do
    @recipe.title = '     '
    assert_not @recipe.valid?
  end

  test 'description should be present' do
    @recipe.description = '     '
    assert_not @recipe.valid?
  end

  test 'should be valid without associations' do
    assert @blank_recipe.valid?
  end
end
