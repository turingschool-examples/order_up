Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #dish
  get "/dishes/:dish_id", to: "dishes#show"

  #chef
  get "/chefs/:chef_id", to: "chefs#show"
  get "/chefs/:chef_id/index", to: "chefs#index"
end
