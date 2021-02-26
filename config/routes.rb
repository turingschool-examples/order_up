Rails.application.routes.draw do
  resources :chefs, only: :show do
    resources :dishes, only: :show
    resources :ingredients, only: :index
  end

  resources :dish_ingredients, only: :destroy
end
