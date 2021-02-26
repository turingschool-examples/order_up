Rails.application.routes.draw do
  resources :dishes, only:[:show]
  namespace :dishes do
    resources :ingredients, only: [:destroy]
  end

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
