Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :dishes, only: [:show]
  get '/dish/:id', to: 'dishes#show'

  get '/chef/:id', to: 'chefs#show'
  get '/chef/:id/ingredients', to: 'chefs#show_ingredients'
end
