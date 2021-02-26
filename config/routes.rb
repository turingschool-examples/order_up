Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chefs, only: [:index, :show] do
    resources :dishes, only: :show
  end

  resources :ingredients, only: :show
end
