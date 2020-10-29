Rails.application.routes.draw do
    resources :dishes, only: [:show]
    resources :chefs, only: [:show]
    get '/chefs/:id/ingredients', to: 'chefs#ingredients'

end
