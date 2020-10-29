Rails.application.routes.draw do

resources :dishes do  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

resources :chefs do
  resources :ingredients do
end
end
end
