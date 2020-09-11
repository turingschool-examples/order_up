Rails.application.routes.draw do

  #==== Dishes
  resources :dishes

  #==== Chefs
  resources :chefs
end
