Rails.application.routes.draw do
  resources :dishes, only: [ :show, :index ]
  resources :chefs, only: :show do
    resources :ingredients
  end
end
