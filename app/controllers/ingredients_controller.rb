class IngredientsController < ApplicationController

    def index
        @chef = Chef.find(params[:chef_id])
        @ingredients = @chef.ingredients.pluck(:name).uniq
    end

end