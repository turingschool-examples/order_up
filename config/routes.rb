Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chefs, only: [:index, :show] do
    resources :dishes
    resources :ingredients, only: [:show, :index]
  end

  resources :dish_ingredients, only: :create
end
