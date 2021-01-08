class ChefIngredientsController < ApplicationController
  before_action :set_chef, only: [:index]

  def index
  end

  private

  def set_chef
    @chef = Chef.find(params[:chef_id])
  end
end