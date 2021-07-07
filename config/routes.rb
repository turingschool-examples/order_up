Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes
  resources :chefs do
    resources :ingredients, controller: :chef_ingredients
  end

end
