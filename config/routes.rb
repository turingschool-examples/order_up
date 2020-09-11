Rails.application.routes.draw do
  resources :dishes, only: [:show]
  get "/chefs/:id", to: "chefs#show"
  get "/chefs/:id/ingredients", to: "chefs#ingredients"
end
