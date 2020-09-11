Rails.application.routes.draw do

  get '/dishes/:dish_id', to: 'dishes#show'

end
