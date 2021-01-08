Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/dishes/:id", to: "dishes#show", as: "dishes_show"

  resources :chefs do
    resources :ingredients, controller: 'chefs/ingredients', only: [:index]
  end
end
