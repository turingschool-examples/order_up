Rails.application.routes.draw do
  get "/dishes/:id", to: "dishes#show"
  get "/chefs/:id", to: "chefs#show"
  get "/chefs/:id/ingredients", to: "ingredients#index"
  patch "/dishes/:id", to: "dishes#update"
end
