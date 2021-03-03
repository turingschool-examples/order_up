Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dish, only: [:show] do 
    resources :ingredient, only: [:destroy]
  end

  resources :chef, only: [:show] do 
    resources :ingredient, only: [:index] 
  end
end
