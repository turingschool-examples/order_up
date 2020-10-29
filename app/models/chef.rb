class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    dishes.select("ingredients.name")
          .joins(:ingredients)
          .pluck("ingredients.name")
          .uniq
  end

  def most_popular_ingredients
    dishes.select("ingredients.name, count(dish_ingredients.ingredient_id) as count_of_ingredients")
          .joins(:dish_ingredients, [:ingredients])
          .group("ingredients.name")
          .order("count_of_ingredients DESC")
          .limit(3)
          .pluck("ingredients.name")
  end
end
