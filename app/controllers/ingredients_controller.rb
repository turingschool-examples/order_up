class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    if @chef.dishes.empty?
      flash[:notice] = "This Chef has no Ingredients"
    end
  end
end
