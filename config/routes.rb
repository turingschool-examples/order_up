Rails.application.routes.draw do
  resources :dishes, only: [ :show, :index ]
end
