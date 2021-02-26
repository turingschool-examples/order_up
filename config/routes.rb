Rails.application.routes.draw do
  resources :dishes, :chefs, only: [:show]
end
