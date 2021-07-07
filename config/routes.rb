Rails.application.routes.draw do

  get '/dishes/:dish_id', to: 'dishes#show'

  get '/chefs/:chef_id', to: 'chefs#show'

  get '/chefs/:chef_id/ingredients', to: 'chefs#index'
end
