Rails.application.routes.draw do
  resources :dishes, only: [:show]

  resources :chefs, only: [:show]
  get "chefs/:id/ingredient_index", to: "chefs#ingredient_index"
end
