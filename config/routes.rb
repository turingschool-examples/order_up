Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dishes/:id', to: 'dishes#show', as: 'dish'
  get '/chefs/:id', to: 'chefs#show', as: 'chef'
  get '/chefs/:id/ingredients', to: 'chefs#ingredients', as: 'chef_ingredients'
end
