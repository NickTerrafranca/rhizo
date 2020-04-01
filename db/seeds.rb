# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  user = User.find_by_email('ricksanchez@example.com')
  user.destroy if user
  user = User.create(first_name: 'Pickle', last_name: 'Rick', email: 'ricksanchez@example.com', password_digest: User.digest('password'), activated: true, activated_at: Time.zone.now)
  recipe = user.recipes.create(title: 'Spicy Dog Food', description: 'FooBar Food')

  recipe.recipe_ingredients.build do |recipe_ingredient|
    recipe_ingredient.build_unit(value: 'ml')
    recipe_ingredient.build_quantity(amount: 28.4)
    recipe_ingredient.build_item(name: 'FloraBloom')
  end
  recipe.save
