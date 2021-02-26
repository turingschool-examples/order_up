Rails.application.routes.draw do
  resources :dishes, only: [:show]
  resources :chefs, only: [:show]

  get "/chefs/:id/ingredients", to: "chef/ingredients#index"
  delete "/dishes/:dish_id/ingredients/:ingredient_id", to: "dish/ingredients#destroy"
end
