Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
   get '/employee/create', to:'employees#create'
   get '/employee/:employee_id', to: 'employees#show'
end
