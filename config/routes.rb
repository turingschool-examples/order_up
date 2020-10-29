Rails.application.routes.draw do
  resources :dishes, only: [:show]

  resources :chefs, only: [:show]

  get '/chefs/:id/ingredients', to: 'ingredients#index'

  # why doesn't his work? I thought it was supposed to know the :id somehow.
  # resources :chefs, only: [:show] do 
  #   resources :ingredients, only: [:index]
  # end
end
