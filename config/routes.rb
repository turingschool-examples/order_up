Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dishes, only: [:show]
  # destroy '/dishes/:id', to: 'ingredients#destroy'

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
