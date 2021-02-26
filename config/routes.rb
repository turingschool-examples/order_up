Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete "/dishes/dish_id/ingredients/ingredient_id", to: "dish_ingredients#destroy"

  resources :dishes, only: [:show]

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end

end
