Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chefs do
    resources :dishes, only: [:show, :destroy]
    resources :ingredients, controller: 'chef_ingredients', only: [:index, :destroy]
  end
end
