Rails.application.routes.draw do
  get '/dishes/:id', to: 'dishes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
