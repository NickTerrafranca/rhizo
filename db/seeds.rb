# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

  user = User.find_by_email('ricksanchez@example.com')
  user.destroy if user
  user = User.create(first_name: 'Pickle', last_name: 'Rick', email: 'ricksanchez@example.com', password_digest: User.digest('password'), activated: true, activated_at: Time.zone.now)
  recipe = user.recipes.create(title: 'Spicy Dog Food', description: 'FooBar Food')

  recipe.recipe_ingredients.build do |recipe_ingredient|
    recipe_ingredient.build_quantity(amount: 28.4, unit: 'ml')
    recipe_ingredient.build_ingredient(name: 'FloraBloom')
  end
  recipe.save

  # recipe.recipe_ingredients.build do |recipe_ingredient|
  #   recipe_ingredient.build_quantity(amount: 18.0, unit: 'ml')
  #   recipe_ingredient.build_ingredient(name: 'FloraGrow')
  # end
  # recipe.save



  # recipe = user.recipes.create(title: 'Rooting formula', description: 'Rooting formula blah blah blah')

  # recipe.recipe_ingredients.build { |recipe_ingredient| recipe_ingredient.create(unit: 'ml'); recipe_ingredient.create(name: 'FloraBloom'); recipe_ingredient.quantity = Quantity.first }
