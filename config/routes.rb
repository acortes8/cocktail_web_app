Rails.application.routes.draw do
  root "cocktails#index"


  resources :cocktails

  #get "/cocktails", to: "cocktails#index"
  #get "/cocktails/:id", to: "cocktails#show"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
