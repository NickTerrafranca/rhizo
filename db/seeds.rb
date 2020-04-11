# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

  user = User.find_by_email('ricksanchez@example.com')
  user.destroy if user
  user = User.create(first_name: 'Pickle', last_name: 'Rick', email: 'ricksanchez@example.com', password_digest: User.digest('password'), activated: true, activated_at: Time.zone.now)

  recipe = user.recipes.create(title: 'Spicy Plant Food', description: 'Next level polaroid trust fund taiyaki yr organic XOXO jean shorts hell of. Jianbing fam affogato intelligentsia, four loko next level microdosing taxidermy hexagon sriracha live-edge PBR&B normcore. Salvia lumbersexual shabby chic hoodie.')

  recipe.recipe_line_items.build do |recipe_line_item|
    recipe_line_item.build_quantity(amount: 28.4, unit: 'ml')
    recipe_line_item.build_ingredient(name: 'FloraBloom')
  end

  recipe.recipe_line_items.build do |recipe_line_item|
    recipe_line_item.build_quantity(amount: 18.0, unit: 'ml')
    recipe_line_item.build_ingredient(name: 'FloraGrow')
  end
  recipe.save

  recipe.batches.create(name: 'Half strength late bloom rose food.', notes: "Ph: 6.1. EC: 1.8", multiplier: 10.0, concentration: 50)
