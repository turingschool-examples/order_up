Rails.application.routes.draw do
  resources :dishes, only: :show
end
