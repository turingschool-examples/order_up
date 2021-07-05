Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dishes/:dish_id', to: 'dishes#show'

  get '/chefs/:chef_id', to: 'chefs#show'

  namespace :chefs do
    get '/:chef_id/ingredients', to: 'ingredients#index'
  end
end
