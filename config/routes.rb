Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes, only: [:show, :destroy]
  resources :chefs, only: [:show]

  get "/chefs/:id/ingredients", to: "ingredients#index", as: "chefs_ingredients"
end
