Rails.application.routes.draw do
  get "cocktails/index"
  root "cocktails#index"

  resources :cocktails
end
