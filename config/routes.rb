Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'chefs#show'
end
