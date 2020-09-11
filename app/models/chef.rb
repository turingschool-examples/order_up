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

  def most_popular
    array = []
    ingreds = self.dishes.map{ |dish| dish.ingredients}
    foods = ingreds.join(", ")
    all_ingreds = foods.split(", ").each{ |food| array << food}
    number= all_ingreds.each_with_object(Hash.new(0)) { |ingred,counts| counts[ingred] += 1 }
    sorted_num =  number.sort_by{ |k,v| v}.reverse
    only_foods = sorted_num.map{ |element| element[0]}
    only_foods[0..2]
  end

end
