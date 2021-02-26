Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dishes/:dish_id', to: 'dishes#show'

  get '/chefs/:chef_id', to: 'chefs#show'

  get '/chefs/:chef_id/ingredients', to: 'chef_ingredients#index'

  delete '/dishes/:dish_id/ingredients/:ingredient_id', to: 'dish_ingredients#destroy'
end
