Rails.application.routes.draw do
 
  resources :products

  get 'home/index'
  get 'home/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
   get '/employee/new', to:'employees#new'
   get '/employee/create', to:'employees#create'
   get '/employee/all', to:'employees#index'
   get '/employee/:employee_id', to: 'employees#show'
   get '/department/new', to: 'department#new'
   get '/department/create', to: 'department#create'
    get '/department/all', to:'department#index'
   # get '/departments/:id', to:'employees#show'
   get '/articles', to:'articles#index'
   get '/articles/new', to:'articles#new'

end
