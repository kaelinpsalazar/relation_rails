Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
 

  get "/authors", to: "authors#index"
  get "/authors/new", to: "authors#new"
  post "/authors", to: "authors#create"
  get "/authors/:id", to: "authors#show", as: 'author'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  resources :books
  resources :authors do
    resources :books
  end
  

  # Defines the root path route ("/")
  # root "posts#index"
end
