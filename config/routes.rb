Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Dishes
  get '/dishes/:id', to: 'dishes#show'

  #Chefs
  get '/chefs/:id', to: 'chefs#show'
end
