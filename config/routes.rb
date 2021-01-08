Rails.application.routes.draw do
  resources :dishes, only: [:show]
  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
