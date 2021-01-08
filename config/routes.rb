Rails.application.routes.draw do
  resources :dishes, only: [:show]
  resources :chefs, only: [:show]
end
