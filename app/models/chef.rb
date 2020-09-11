class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    array = []
    ingreds = self.dishes.map{ |dish| dish.ingredients}
    foods = ingreds.join(", ")
    foods.split(", ").each{ |food| array << food}
    array.uniq
  end

end
