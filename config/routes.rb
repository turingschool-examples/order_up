Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'chefs/:id', to: 'chefs#show'
  get '/chefs/:chef_id/dishes/:id', to: 'dishes#show'
  get '/chefs/:id/ingredients', to: 'chef_ingredients#show'
end
