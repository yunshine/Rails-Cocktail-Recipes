Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"

  # get "cocktails/:id", to: "cocktails#show", as: :cocktail
  resources :cocktails, only: [:index, :show]
end
