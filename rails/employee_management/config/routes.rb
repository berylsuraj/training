Rails.application.routes.draw do
  root 'sessions#new'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  # Login page
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  
  #Landing page after login
  get '/tweets', to: 'tweets#index'

  #User registration
  get '/user', to: 'users#new'
  post '/user', to: 'users#create'

  #user logout
  get '/logout', to: 'sessions#destroy'
  
  #verifying user via email
  get '/verify/:id', to: 'verification#new'
  post '/verify/:id', to: 'verification#create'
  
 

end
