Rails.application.routes.draw do
  resources :dishes, only: :show
  resources :chefs, only: :show
  get "/chefs/:chef_id/ingredients", to: "chefs#ingredients_index", as: "chef_ingredients"
end
