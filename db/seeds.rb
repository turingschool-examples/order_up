Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all
DishIngredient.destroy_all

@c1 = Chef.create(name: 'Isabelle')

@d1 = @c1.dishes.create(name: 'Ramen', description: 'Yum Yum Noods')

@i1 = Ingredient.create!(name: 'Noodles', calories: 100)
@i2 = Ingredient.create!(name: 'Egg', calories: 30)
@i3 = Ingredient.create!(name: 'Green Onions', calories: 8)
@i4 = Ingredient.create!(name: 'Enoki', calories: 18)

DishIngredient.create!(dish: @d1, ingredient: @i1)
DishIngredient.create!(dish: @d1, ingredient: @i2)
DishIngredient.create!(dish: @d1, ingredient: @i3)
DishIngredient.create!(dish: @d1, ingredient: @i4)