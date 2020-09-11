Rails.application.routes.draw do
  resources :dishes, only: [:show]
  get "/chefs/:id", to: "chefs#show"
end
