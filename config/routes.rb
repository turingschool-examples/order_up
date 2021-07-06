Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dish/:dish_id', to: 'dishes#show'
  get '/chef/:chef_id', to: 'chefs#show'
  get '/chef/:chef_id/ingredients', to: 'chef_ingredients#index'
end
