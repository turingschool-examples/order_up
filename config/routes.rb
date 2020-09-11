Rails.application.routes.draw do

  #==== Dishes
  resources :dishes

  #==== Chefs
  resources :chefs do
    resources :dishes
    resources :ingredients
  end
end
