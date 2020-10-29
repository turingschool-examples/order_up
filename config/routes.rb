Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dish/:id', to: 'dishes#show'
  
  get '/chef/:id', to: 'chefs#show'
  get '/chef/:id/ingredients', to: 'chef_ingredients#index'
end
