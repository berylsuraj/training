Rails.application.routes.draw do

  resources :tweets do
    member do
      post :edit
    end
    collection do
      post :search
    end
  end
  root 'tweets#index'
  resources :bands
  resources :students
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :products
  resources :articles
  get 'home/index'
  get 'home/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
   get '/employee/new', to:'employees#new'
   get '/employee/create', to:'employees#create'
   get '/employee/all', to:'employees#index'
   get '/employee/:employee_id', to: 'employees#show'
   get '/department/new', to: 'department#new'
   get '/department/create', to: 'department#create'
    get '/department/all', to:'department#index'
   # get '/departments/:id', to:'employees#show'
   # get '/articles', to:'articles#index'
   # get '/articles/new', to:'articles#new'
   # post '/articles', to:'articles#create'
   # get '/articles/:id', to:'articles#show'
   #get '/article/:id/edit', to: 'articles#edit'
   get '/article/search', to: 'articles#search'

end
