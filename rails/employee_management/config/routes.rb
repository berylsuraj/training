Rails.application.routes.draw do
  resources :tweets
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  root 'sessions#new'
  get '/sign_in', to:'sessions#new'
  post '/sign_in', to:'sessions#create'
  get '/logout', to: 'sessions#destroy'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
