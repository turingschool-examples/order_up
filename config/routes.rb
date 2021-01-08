Rails.application.routes.draw do
  resources :dishes, only: [:show] do
    resources :ingredients, only: [:show]
  end
  resources :chefs, only: [:show]
end
