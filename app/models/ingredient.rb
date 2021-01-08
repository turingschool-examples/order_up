class Ingredient < ApplicationRecord
    validates_presence_of :name, :calories
    has_many :recipes
    has_many :dishes, through: :recipes
    # has_many :chefs, through: :recipes

    def self.top_three
        Ingredient.joins(:dishes).select("ingredients.name, count('dishes') AS dish_count").group(:id).order("dish_count desc")
        # Ingredient.joins(:dishes).group(:id).order(Arel.sql("count(dishes)")).limit(3)
    end

    def dish_count
        dishes.count
    end
end