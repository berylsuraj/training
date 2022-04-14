Rails.application.routes.draw do
  resources :users
  get 'posts/index'
  get 'posts/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
 
  get "/post", to: "posts#new"
  post "/post", to: "posts#create"
end
