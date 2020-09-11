Rails.application.routes.draw do
  get '/dishes/:id', to: 'dishes#show'
  get '/chefs/:id', to: 'chefs#show'
  get '/chefs/:id/ingredients', to: 'chefs_ingredients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
