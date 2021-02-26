Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dishes, only: [:show, :index]
  resources :chefs, only: [:show]

  get "/chefs/:id/ingredients", to: "chef_ingredients#index"
  delete "dishes/:id/ingredients/:id", to: "dish_ingredients#destroy"
  get "dishes/:id/ingredients", to: "dish_ingredients#index"


end
