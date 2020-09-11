Rails.application.routes.draw do
  resources :chefs, only: [:show]
  get '/chefs/:id/ingredients', to: 'chef_ingredients#index'

  resources :dishes, only: [:show]
end
