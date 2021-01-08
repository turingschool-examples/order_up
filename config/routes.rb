Rails.application.routes.draw do
  resources :dishes, only: [:show] do
    resources :ingredients, only: [:show, :index]
  end
    resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
