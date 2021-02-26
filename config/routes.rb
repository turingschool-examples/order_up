Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #dishes
  resources :dishes, only: [:show]

  #chefs
  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
