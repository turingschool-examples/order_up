Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes, only: [:show]
  resources :chefs, only: [:show]
  get "/chefs/:id/ingredients", to: "chef/ingredients#index", as: 'chef_ingredients'
  delete "/dishes/:dish_id/ingredients/:ingredient_id", to: "dish_ingredients#destroy"
end
